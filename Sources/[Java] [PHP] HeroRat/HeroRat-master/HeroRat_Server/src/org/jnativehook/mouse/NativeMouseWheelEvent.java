package org.jnativehook.mouse;

import org.jnativehook.mouse.NativeMouseEvent;

public class NativeMouseWheelEvent extends NativeMouseEvent {

   private static final long serialVersionUID = -183110294708745910L;
   public static final int WHEEL_UNIT_SCROLL = 0;
   public static final int WHEEL_BLOCK_SCROLL = 1;
   private int scrollAmount;
   private int scrollType;
   private int wheelRotation;


   public NativeMouseWheelEvent(int var1, long var2, int var4, int var5, int var6, int var7, int var8, int var9, int var10) {
      super(var1, var2, var4, var5, var6, var7);
      this.scrollType = var8;
      this.scrollAmount = var9;
      this.wheelRotation = var10;
   }

   public int getScrollAmount() {
      return this.scrollAmount;
   }

   public int getScrollType() {
      return this.scrollType;
   }

   public int getWheelRotation() {
      return this.wheelRotation;
   }

   public String paramString() {
      StringBuilder var1 = new StringBuilder(super.paramString());
      var1.append(",scrollType=");
      switch(this.getScrollType()) {
      case 0:
         var1.append("WHEEL_UNIT_SCROLL");
         break;
      case 1:
         var1.append("WHEEL_BLOCK_SCROLL");
         break;
      default:
         var1.append("unknown scroll type");
      }

      var1.append(",scrollAmount=");
      var1.append(this.getScrollAmount());
      var1.append(",wheelRotation=");
      var1.append(this.getWheelRotation());
      return var1.toString();
   }
}
