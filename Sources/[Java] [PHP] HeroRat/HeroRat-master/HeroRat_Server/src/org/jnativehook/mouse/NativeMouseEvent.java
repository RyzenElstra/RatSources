package org.jnativehook.mouse;

import java.awt.Point;
import org.jnativehook.GlobalScreen;
import org.jnativehook.NativeInputEvent;

public class NativeMouseEvent extends NativeInputEvent {

   private static final long serialVersionUID = 6869201569046923469L;
   private int x;
   private int y;
   private int clickCount;
   private int button;
   public static final int NATIVE_MOUSE_FIRST = 2500;
   public static final int NATIVE_MOUSE_LAST = 2505;
   public static final int NATIVE_MOUSE_CLICKED = 2500;
   public static final int NATIVE_MOUSE_PRESSED = 2501;
   public static final int NATIVE_MOUSE_RELEASED = 2502;
   public static final int NATIVE_MOUSE_MOVED = 2503;
   public static final int NATIVE_MOUSE_DRAGGED = 2504;
   public static final int NATIVE_MOUSE_WHEEL = 2505;
   public static final int NOBUTTON = 0;
   public static final int BUTTON1 = 1;
   public static final int BUTTON2 = 2;
   public static final int BUTTON3 = 3;
   public static final int BUTTON4 = 4;
   public static final int BUTTON5 = 5;


   public NativeMouseEvent(int var1, long var2, int var4, int var5, int var6, int var7) {
      this(var1, var2, var4, var5, var6, var7, 0);
   }

   public NativeMouseEvent(int var1, long var2, int var4, int var5, int var6, int var7, int var8) {
      super(GlobalScreen.getInstance(), var1, var2, var4);
      this.x = var5;
      this.y = var6;
      this.clickCount = var7;
      this.button = var8;
   }

   public int getButton() {
      return this.button;
   }

   public int getClickCount() {
      return this.clickCount;
   }

   public Point getPoint() {
      return new Point(this.x, this.y);
   }

   public int getX() {
      return this.x;
   }

   public int getY() {
      return this.y;
   }

   public String paramString() {
      StringBuilder var1 = new StringBuilder(255);
      switch(this.getID()) {
      case 2500:
         var1.append("NATIVE_MOUSE_CLICKED");
         break;
      case 2501:
         var1.append("NATIVE_MOUSE_PRESSED");
         break;
      case 2502:
         var1.append("NATIVE_MOUSE_RELEASED");
         break;
      case 2503:
         var1.append("NATIVE_MOUSE_MOVED");
         break;
      case 2504:
         var1.append("NATIVE_MOUSE_DRAGGED");
         break;
      case 2505:
         var1.append("NATIVE_MOUSE_WHEEL");
         break;
      default:
         var1.append("unknown type");
      }

      var1.append(",(");
      var1.append(this.x);
      var1.append(',');
      var1.append(this.y);
      var1.append("),");
      var1.append("button=");
      var1.append(this.button);
      if(this.getModifiers() != 0) {
         var1.append(",modifiers=");
         var1.append(getModifiersText(this.getModifiers()));
      }

      var1.append(",clickCount=");
      var1.append(this.getClickCount());
      return var1.toString();
   }
}
