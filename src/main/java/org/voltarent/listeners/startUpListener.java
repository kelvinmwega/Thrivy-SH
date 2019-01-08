package org.voltarent.listeners;

import org.springframework.context.ApplicationContext;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;


@Component
public class startUpListener {

    private final static String PROPERTIES_FILE_NAME = "/device.properties";


    @EventListener(ContextRefreshedEvent.class)
    public void onApplicationEvent(ContextRefreshedEvent event){
        //System.out.println("Thread already Started");

        ApplicationContext context = event.getApplicationContext();
        String contextName = new String(context.getDisplayName());
        System.out.println(contextName.substring(0,4));

        if ("Root".equals(contextName.substring(0,4))) {
            try {

//                ioTHandler.initClientApp();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Look Elsewhere.");
        }
    }

}
