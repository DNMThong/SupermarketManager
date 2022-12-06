package component;

import javax.swing.border.AbstractBorder;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;

public class DashedBorder extends AbstractBorder {
    @Override
    public void paintBorder(Component comp, Graphics graphics, int x, int y, int width, int height) {
        float dash1[] = { 10.0f };
        BasicStroke dashed = new BasicStroke(1.0f,
                BasicStroke.CAP_BUTT, BasicStroke.JOIN_MITER, 10.0f, dash1, 0.0f);
        Graphics2D g2 = (Graphics2D) graphics;
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);

        g2.setPaint(Color.gray);


        g2.setStroke(dashed);
        g2.draw(new RoundRectangle2D.Double(x+1, y+1, width - x - 10, height - y - 10,
                10, 10));
    }
}