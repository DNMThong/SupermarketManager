package utils;

import component.sidebar.MenuItem;
import component.sidebar.Sidebar_Menu;

import ui.MainContent;

import javax.swing.*;

public class Util {
    public static void setTimeout(Runnable runnable, int delay){
        new Thread(() -> {
            try {
                Thread.sleep(delay);
                runnable.run();
            }
            catch (Exception e){
                System.err.println(e);
            }
        }).start();
    }

    public static JFrame mainFrame = null;

    public static JPanel containerContent = null;

    public static Sidebar_Menu siderbarMenu = null;

}
