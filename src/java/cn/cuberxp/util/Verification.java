package cn.cuberxp.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class Verification {
    private static String code;
    public static BufferedImage verification(){
        //定义图片的宽和高
        int w=60;
        int h=30;
        String str = "";
        //声明一个RGB格式的内存中的图片
        BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();

        //把背景变白色
        g.setColor(Color.white);
        g.fillRect(0, 0, w, h);
        //设置字体
        g.setFont(new Font("aa",Font.BOLD,18));

        //产生并draw出4个随机数字
        Random r = new Random();
        for(int i=0;i<4;i++){
            int a = r.nextInt(10);//生成0~9之间的随机整数
            str += a;
            int y = 15+r.nextInt(20);//产生随机的垂直位置
            //产生随机颜色
            Color c = new Color(r.nextInt(256),r.nextInt(256),r.nextInt(256));
            g.setColor(c);

            g.drawString(""+a, i*15, y);
        }

        //画几条干扰线
        for(int i=0;i<10;i++){
            //产生随机颜色
            Color c = new Color(r.nextInt(256),r.nextInt(256),r.nextInt(256));
            g.setColor(c);
            g.drawLine(r.nextInt(60), r.nextInt(30), r.nextInt(60), r.nextInt(30));
        }

        g.dispose();//类似于IO中的flush(),把图形数据刷到img中

        code = str;
        return img;
    }

    public static String getCode() {
        return code;
    }
}
