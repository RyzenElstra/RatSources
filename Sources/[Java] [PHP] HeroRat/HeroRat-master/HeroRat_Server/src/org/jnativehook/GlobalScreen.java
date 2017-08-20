package org.jnativehook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.EventListener;
import javax.swing.event.EventListenerList;
import org.jnativehook.NativeHookException;
import org.jnativehook.NativeInputEvent;
import org.jnativehook.NativeSystem;
import org.jnativehook.keyboard.NativeKeyEvent;
import org.jnativehook.keyboard.NativeKeyListener;
import org.jnativehook.mouse.NativeMouseEvent;
import org.jnativehook.mouse.NativeMouseListener;
import org.jnativehook.mouse.NativeMouseMotionListener;
import org.jnativehook.mouse.NativeMouseWheelEvent;
import org.jnativehook.mouse.NativeMouseWheelListener;

public class GlobalScreen {

   private static final GlobalScreen instance = new GlobalScreen();
   private EventListenerList eventListeners = new EventListenerList();


   private GlobalScreen() {
      loadNativeLibrary();
   }

   protected void finalize() throws Throwable {
      try {
         unloadNativeLibrary();
      } catch (NativeHookException var5) {
         throw var5;
      } finally {
         super.finalize();
      }

   }

   public static GlobalScreen getInstance() {
      return instance;
   }

   public void addNativeKeyListener(NativeKeyListener var1) {
      if(var1 != null) {
         this.eventListeners.add(NativeKeyListener.class, var1);
      }

   }

   public void removeNativeKeyListener(NativeKeyListener var1) {
      if(var1 != null) {
         this.eventListeners.remove(NativeKeyListener.class, var1);
      }

   }

   public void addNativeMouseListener(NativeMouseListener var1) {
      if(var1 != null) {
         this.eventListeners.add(NativeMouseListener.class, var1);
      }

   }

   public void removeNativeMouseListener(NativeMouseListener var1) {
      if(var1 != null) {
         this.eventListeners.remove(NativeMouseListener.class, var1);
      }

   }

   public void addNativeMouseMotionListener(NativeMouseMotionListener var1) {
      if(var1 != null) {
         this.eventListeners.add(NativeMouseMotionListener.class, var1);
      }

   }

   public void removeNativeMouseMotionListener(NativeMouseMotionListener var1) {
      if(var1 != null) {
         this.eventListeners.remove(NativeMouseMotionListener.class, var1);
      }

   }

   public void addNativeMouseWheelListener(NativeMouseWheelListener var1) {
      if(var1 != null) {
         this.eventListeners.add(NativeMouseWheelListener.class, var1);
      }

   }

   public void removeNativeMouseWheelListener(NativeMouseWheelListener var1) {
      if(var1 != null) {
         this.eventListeners.remove(NativeMouseWheelListener.class, var1);
      }

   }

   public static native void registerNativeHook() throws NativeHookException;

   public static native void unregisterNativeHook() throws NativeHookException;

   public static native boolean isNativeHookRegistered();

   public static native boolean isNativeDispatchThread();

   public final void dispatchEvent(NativeInputEvent var1) {
      if(var1 instanceof NativeKeyEvent) {
         this.processKeyEvent((NativeKeyEvent)var1);
      } else if(var1 instanceof NativeMouseWheelEvent) {
         this.processMouseWheelEvent((NativeMouseWheelEvent)var1);
      } else if(var1 instanceof NativeMouseEvent) {
         this.processMouseEvent((NativeMouseEvent)var1);
      }

   }

   protected void processKeyEvent(NativeKeyEvent var1) {
      int var2 = var1.getID();
      EventListener[] var3 = this.eventListeners.getListeners(NativeKeyListener.class);

      for(int var4 = 0; var4 < var3.length; ++var4) {
         switch(var2) {
         case 2400:
            ((NativeKeyListener)var3[var4]).nativeKeyTyped(var1);
            break;
         case 2401:
            ((NativeKeyListener)var3[var4]).nativeKeyPressed(var1);
            break;
         case 2402:
            ((NativeKeyListener)var3[var4]).nativeKeyReleased(var1);
         }
      }

   }

   protected void processMouseEvent(NativeMouseEvent var1) {
      int var2 = var1.getID();
      EventListener[] var3;
      if(var2 != 2503 && var2 != 2504) {
         var3 = this.eventListeners.getListeners(NativeMouseListener.class);
      } else {
         var3 = this.eventListeners.getListeners(NativeMouseMotionListener.class);
      }

      for(int var4 = 0; var4 < var3.length; ++var4) {
         switch(var2) {
         case 2500:
            ((NativeMouseListener)var3[var4]).nativeMouseClicked(var1);
            break;
         case 2501:
            ((NativeMouseListener)var3[var4]).nativeMousePressed(var1);
            break;
         case 2502:
            ((NativeMouseListener)var3[var4]).nativeMouseReleased(var1);
            break;
         case 2503:
            ((NativeMouseMotionListener)var3[var4]).nativeMouseMoved(var1);
            break;
         case 2504:
            ((NativeMouseMotionListener)var3[var4]).nativeMouseDragged(var1);
         }
      }

   }

   protected void processMouseWheelEvent(NativeMouseWheelEvent var1) {
      EventListener[] var2 = this.eventListeners.getListeners(NativeMouseWheelListener.class);

      for(int var3 = 0; var3 < var2.length; ++var3) {
         ((NativeMouseWheelListener)var2[var3]).nativeMouseWheelMoved(var1);
      }

   }

   protected static void loadNativeLibrary() {
      String var0 = "JNativeHook";

      try {
         System.loadLibrary(var0);
      } catch (UnsatisfiedLinkError var9) {
         try {
            String var2 = "/org/jnativehook/lib/" + NativeSystem.getFamily() + "/" + NativeSystem.getArchitecture() + "/";
            File var3 = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator", File.separator) + System.mapLibraryName(var0));
            FileOutputStream var4 = new FileOutputStream(var3);
            byte[] var5 = new byte[4096];
            InputStream var6 = GlobalScreen.class.getResourceAsStream(var2.toLowerCase() + System.mapLibraryName(var0));

            int var7;
            while((var7 = var6.read(var5)) != -1) {
               var4.write(var5, 0, var7);
            }

            var4.close();
            var6.close();
            var3.deleteOnExit();
            System.load(var3.getPath());
         } catch (IOException var8) {
            throw new RuntimeException(var8.getMessage());
         }
      }

   }

   protected static void unloadNativeLibrary() throws NativeHookException {
      unregisterNativeHook();
   }

}
