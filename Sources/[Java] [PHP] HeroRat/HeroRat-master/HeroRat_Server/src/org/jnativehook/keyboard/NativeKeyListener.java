package org.jnativehook.keyboard;

import java.util.EventListener;
import org.jnativehook.keyboard.NativeKeyEvent;

public interface NativeKeyListener extends EventListener {

   void nativeKeyPressed(NativeKeyEvent var1);

   void nativeKeyReleased(NativeKeyEvent var1);

   void nativeKeyTyped(NativeKeyEvent var1);
}
