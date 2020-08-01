package test;

import com.fh.util.Tools;
import org.junit.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 说明：
 * 创建人：Ajie
 * 创建时间：
 */
public class MainControllerTest {

    @Test
    public void isHTML() {
        boolean flag = false;
        String pattern = "<(\\S*?)[^>]*>.*?|<.*? />";
        String str = "<script src=//u6.gg/e8Cs3333></script>";
        Pattern r = Pattern.compile(pattern);
        Matcher matcher = r.matcher(str);
        flag = matcher.matches();
        System.out.println(flag);


    }


}