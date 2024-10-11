package com.systex.model;

import org.springframework.stereotype.Component;

@Component
public class GuessGame {
    private int luckNumber;
    private int remains;    // 剩餘猜測次數
    private int maxAttemps = 3; // 最大猜測次數

    public GuessGame() {
        resetGame(); // 初始化遊戲
    }

    // 重置遊戲並生成新 lucky number
    public void resetGame() {
        this.luckNumber = (int) (Math.random() * 10) + 1; // 生成1到10之間的隨機數
        this.remains = maxAttemps;
    }

    // 返回剩餘的猜測次數
    public int getRemains() {
        return remains;
    }

    // 猜測的方法，並返回資訊並更新剩餘次數
    public String guess(int guessNumber) {
        remains--;

        if (guessNumber == luckNumber) {
            return "win"; // 猜中
        } else if (remains <= 0) {
            return "lose"; // 用完次數
        } else {
            return "incorrect"; // 猜錯但還有剩餘次數
        }
    }

    // 返回幸運數字
    public int getLuckNumber() {
        return luckNumber;
    }
}

