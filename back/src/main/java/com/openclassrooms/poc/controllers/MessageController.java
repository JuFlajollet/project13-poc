package com.openclassrooms.poc.controllers;

import com.openclassrooms.poc.model.NewMessage;
import com.openclassrooms.poc.model.TchatMessage;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class MessageController {

    @MessageMapping("/message")
    @SendTo("/topic/tchating")
    public TchatMessage tchating(NewMessage message) {
        return new TchatMessage(HtmlUtils.htmlEscape(message.getUser()) + " : " + HtmlUtils.htmlEscape(message.getContent()));
    }
}