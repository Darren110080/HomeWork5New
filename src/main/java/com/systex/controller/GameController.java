package com.systex.controller;

import com.systex.model.GuessGame;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;


@Controller
public class GameController {

    //顯示遊戲介面
    @GetMapping("/guess")
    public String showGuessPage(HttpSession session, Model model) {
        GuessGame game = (GuessGame) session.getAttribute("game");

        // 初始化遊戲
        if (game == null) {
            game = new GuessGame();
            session.setAttribute("game", game);
        }

        // 返回猜測頁面
        return "guess"; // 返回 guess.jsp
    }

    // 處理猜測的 POST 請求
    @PostMapping("/guess")
    public String handleGuess(
            @RequestParam("group") String guessStr,
            HttpSession session,
            Model model) {
        
        // 獲取 GuessGame 對象
        GuessGame game = (GuessGame) session.getAttribute("game");

        // 嘗試將輸入的數字轉換為整數
        int guess;
        try {
            guess = Integer.parseInt(guessStr);
        } catch (NumberFormatException e) {
            model.addAttribute("message", "請輸入有效的數字！");
            return "guess"; // 返回 guess.jsp
        }

        // 猜測結果處理
        String result = game.guess(guess);
        model.addAttribute("luckNumber", game.getLuckNumber());

        switch (result) {
            case "win":
//                session.invalidate(); // 清空 session
                return "youWin"; // 返回 youWin.jsp
            case "lose":
//                session.invalidate();
                return "youLose"; // 返回 youLose.jsp
            case "incorrect":
                model.addAttribute("message", "猜錯了！還剩 " + game.getRemains() + " 次機會。");
                return "guess"; // 返回 guess.jsp
            default:
                return "guess"; // 返回 guess.jsp
        }
    }
}
