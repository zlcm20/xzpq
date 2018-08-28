<%@ page contentType="image/jpeg"   import="java.awt.*, java.awt.image.*,java.util.*,javax.imageio.*" pageEncoding="utf-8"%>
<%!
    Color getRandColor(int fc, int bc) {//随机颜色
			Random random = new Random();
			if (fc > 255)
				fc = 255;
			if (bc > 255)
				bc = 255;
			int r = fc + random.nextInt(bc - fc);//red
			int g = fc + random.nextInt(bc - fc);//gree
			int b = fc + random.nextInt(bc - fc);//blue
			return new Color(r, g, b);
	}
%>
<%
	out.clear();//这句针对resin服务器，如果是tomacat可以不要这句  、清空jsp缓存
	
	//验证码无缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	//设置图片的大小
	int width = 60, height = 20;
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics g = image.getGraphics();
	Random random = new Random();
	//g.setColor(getRandColor(200, 250));
	g.fillRect(0, 0, width, height);  //绘制一个长方形
	//g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
	g.setColor(getRandColor(160, 200));
	
	//绘制ganrao线
	//for (int i = 0; i < 155; i++) {
	//	int x = random.nextInt(width);
	//	int y = random.nextInt(height);
	//	int xl = random.nextInt(12);
	//	int yl = random.nextInt(12);
	//	g.drawLine(x, y, x + xl, y + yl);
	//              起始                终止
	//}
	
	String sRand = "";
	//验证码位数
	for (int i = 0; i < 4; i++) {
		String rand = String.valueOf(random.nextInt(10));  //  0-9
		sRand += rand;//拼接
		//画板的颜色
		//g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
		g.drawString(rand, 13 * i + 6, 16);
	}
	// 将认证码存入SESSION  
	session.setAttribute("rand", sRand);
	g.dispose();//清空缓存
	ImageIO.write(image, "JPEG", response.getOutputStream());
	out.clear();
%>
