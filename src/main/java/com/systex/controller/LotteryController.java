package com.systex.controller;

import com.systex.model.LotteryService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LotteryController {

    private final LotteryService lotteryService;

 
    public LotteryController(LotteryService lotteryService) {
        this.lotteryService = lotteryService;  // 透過依賴注入 LotteryService
    }


@GetMapping("/lottery")
public String showLotteryPage(Model model) {
    // 初始化模型屬性（如有需要）
    model.addAttribute("group", "");
    model.addAttribute("exclude", "");
    return "lottery"; // 返回 lottery
}

@PostMapping("/lottery")
public String generateLotteryResults(
        @RequestParam("group") String group,
        @RequestParam("exclude") String exclude,
        Model model) {
    // 將 exclude 以空格分隔並轉換為逗號分隔
    String[] excludeArray = exclude.split("\\s+");
    String excludeCommaSeparated = String.join(", ", excludeArray);

    // 使用 LotteryService 生成樂透結果
    String resultMessage = lotteryService.generateLotteryResults(group, exclude);

    // 將結果放入模型中以便於 JSP 使用
    model.addAttribute("group", group);
    model.addAttribute("exclude", excludeCommaSeparated);
    model.addAttribute("result", resultMessage);
    
    return "lotteryResult"; // 返回 result.jsp
}
}



