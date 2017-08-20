package org.jnativehook.mouse;

import java.util.EventListener;
import org.jnativehook.mouse.NativeMouseEvent;

public interface NativeMouseMotionListener extends EventListener {

   void nativeMouseMoved(NativeMouseEvent var1);

   void nativeMouseDragged(NativeMouseEvent var1);
}
