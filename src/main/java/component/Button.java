package component;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class Button extends JButton{

	public boolean isOver() {
        return over;
    }

    public void setOver(boolean over) {
        this.over = over;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
        setBackground(color);
    }

    public Color getColorOver() {
        return colorOver;
    }

    public void setColorOver(Color colorOver) {
        this.colorOver = colorOver;
    }

    public Color getColorClick() {
        return colorClick;
    }

    public void setColorClick(Color colorClick) {
        this.colorClick = colorClick;
    }

    public Color getBorderColor() {
        return borderColor;
    }

    public void setBorderColor(Color borderColor) {
        this.borderColor = borderColor;
    }

    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }

    public Button() {
    	setContentAreaFilled(false);
        //  Init Color

        setColor(new Color(227, 81, 81));
        colorOver = new Color(241, 99, 99);
        colorClick = new Color(242, 44, 44);
        borderColor = new Color(255, 32, 32);
        //  Add event mouse
        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent me) {
                setBackground(colorOver);
                setForeground(Color.WHITE);
                over = true;
            }

            @Override
            public void mouseExited(MouseEvent me) {
                setBackground(color);
                setForeground(Color.white);
                over = false;
            }

            @Override
            public void mousePressed(MouseEvent me) {
                setBackground(colorClick);
                setForeground(Color.WHITE);
            }

            @Override
            public void mouseReleased(MouseEvent me) {
                if (over) {
                    setBackground(colorOver);
                    setForeground(Color.WHITE);
                } else {
                    setBackground(color);
                }
            }
        });
    }

    private boolean over;
    private Color color;
    private Color colorOver;
    private Color colorClick;
    private Color borderColor;
    private int radius = 0;

    @Override
    protected void paintComponent(Graphics grphcs) {
        Graphics2D g2 = (Graphics2D) grphcs;
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        //  Paint Border
        g2.setColor(borderColor);
        g2.fillRoundRect(0, 0, getWidth(), getHeight(), radius, radius);
        g2.setColor(getBackground());
        //  Border set 2 Pix
        g2.fillRoundRect(1, 1, getWidth() - 2, getHeight() - 2, radius, radius);
        super.paintComponent(grphcs);
    }
}
