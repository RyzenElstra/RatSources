package org.jnativehook.mouse;

import java.util.EventListener;
import org.jnativehook.mouse.NativeMouseEvent;

public interface NativeMouseListener extends EventListener {

   void nativeMouseClicked(NativeMouseEvent var1);

   void nativeMousePressed(NativeMouseEvent var1);

   void nativeMouseReleased(NativeMouseEvent var1);
}
