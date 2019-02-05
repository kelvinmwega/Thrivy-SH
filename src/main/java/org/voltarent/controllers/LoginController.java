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

    @RequestMapping(value = { "/dashpage"}, method = RequestMethod.GET)
    public String dashPage() {
//        ModelAndView model = new ModelAndView();
//        model.setViewName("homepage");
        return "dashpage";
    }

    @RequestMapping(value = { "/livingpage"}, method = RequestMethod.GET)
    public String livingPage() {
//        ModelAndView model = new ModelAndView();
//        model.setViewName("homepage");
        return "livingpage";
    }

    @RequestMapping(value = { "/master"}, method = RequestMethod.GET)
    public String masterPage() {
//        ModelAndView model = new ModelAndView();
//        model.setViewName("homepage");
        return "master_room";
    }

    @RequestMapping(value = { "/wl_hist"}, method = RequestMethod.GET)
    public String wl_hist_Page() {
        return "wl-history";
    }

    @RequestMapping(value = { "/lr_hist"}, method = RequestMethod.GET)
    public String lr_hist_Page() {
        return "lr-history";
    }

    @RequestMapping(value = { "/mb_hist"}, method = RequestMethod.GET)
    public String mb_hist_Page() {
        return "mb-history";
    }

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public ModelAndView loginPage(@RequestParam(value = "error",required = false) String error,
                                  @RequestParam(value = "logout",	required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid Credentials provided!.");
        }

        if (logout != null) {
            model.addObject("message", "Logged out Successfully.");
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

    @RequestMapping(value = { "/landingpage"}, method = RequestMethod.GET)
    public ModelAndView landingPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("landingpage");
        return model;
    }

}


