package org.jnativehook.mouse;

import java.util.EventListener;
import org.jnativehook.mouse.NativeMouseWheelEvent;

public interface NativeMouseWheelListener extends EventListener {

   void nativeMouseWheelMoved(NativeMouseWheelEvent var1);
}
