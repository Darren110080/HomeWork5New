package com.systex.model;

import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class LotteryService {

    public String generateLotteryResults(String group, String exclude) {
        int groupNumber;
        try {
            groupNumber = Integer.parseInt(group);
        } catch (NumberFormatException e) {
            return "錯誤，請輸入整數";
        }

        Set<Integer> excludeNumbers = parseExcludeNumbers(exclude);
        List<Set<Integer>> lotteryResults = new ArrayList<>();

        for (int i = 1; i <= groupNumber; i++) {
            Set<Integer> selectedNumbers = recommendNumbers(excludeNumbers);
            lotteryResults.add(selectedNumbers);
        }

        return assembleResults(lotteryResults);
    }

    private Set<Integer> parseExcludeNumbers(String exclude) {
        Set<Integer> excludeNumbers = new HashSet<>();
        if (exclude != null && !exclude.trim().isEmpty()) {
            String[] numbers = exclude.split(" ");
            for (String numberStr : numbers) {
                try {
                    excludeNumbers.add(Integer.parseInt(numberStr));
                } catch (NumberFormatException e) {
                    // 忽略無效的數字
                }
            }
        }
        return excludeNumbers;
    }

    private Set<Integer> recommendNumbers(Set<Integer> excludeNumbers) {
        Random random = new Random();
        Set<Integer> selectedNumbers = new TreeSet<>();

        while (selectedNumbers.size() < 6) {
            int newNumber = random.nextInt(49) + 1;
            if (!excludeNumbers.contains(newNumber)) {
                selectedNumbers.add(newNumber);
            }
        }
        return selectedNumbers;
    }

    private String assembleResults(List<Set<Integer>> lotteryResults) {
        StringBuilder lastResult = new StringBuilder();
        for (int i = 0; i < lotteryResults.size(); i++) {
            lastResult.append("Group ").append(i + 1).append(": ").append(lotteryResults.get(i)).append("<br/>");
        }
        return lastResult.toString();
    }
}
