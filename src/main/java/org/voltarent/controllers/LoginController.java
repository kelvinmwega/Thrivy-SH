package org.voltarent.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by kevmw on 19/10/2018.
 */

@Controller
public class LoginController {

    @RequestMapping(value = { "/"}, method = RequestMethod.GET)
    public ModelAndView welcomePage() {
        ModelAndView model = new ModelAndView();
//        model.setViewName("welcomePage");
        model.setViewName("loginPage");
        return model;
    }

    @RequestMapping(value = { "/homepage"}, method = RequestMethod.GET)
    public String homePage() {
//        ModelAndView model = new ModelAndView();
//        model.setViewName("homepage");
        return "homepage";
    }

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public ModelAndView loginPage(@RequestParam(value = "error",required = false) String error,
                                  @RequestParam(value = "logout",	required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid Credentials provided!.");
        }

        if (logout != null) {
            model.addObject("message", "Logged out from Thrivy Facilities Successfully.");
        }

        model.setViewName("loginPage");
        return model;
    }

    @RequestMapping(value = { "/analytics"}, method = RequestMethod.GET)
    public ModelAndView analyticsPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("analytics");
        return model;
    }

    @RequestMapping(value = { "/events"}, method = RequestMethod.GET)
    public ModelAndView eventsPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("events");
        return model;
    }

    @RequestMapping(value = { "/tankpage"}, method = RequestMethod.GET)
    public ModelAndView tankPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("tankpage");
        return model;
    }

}


