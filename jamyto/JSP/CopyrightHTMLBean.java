package atmarkit;
 
/**
 * 著作権表示用のHTMLを生成するBean
 */
public class CopyrightHTMLBean {
 
    /** 著作年 */
    private String year = "";
    public void setYear(String year) { this.year = year; }
 
    /** 著作者 */
    private String name = "";
    public void setName(String name) { this.name = name; }
 
    /** メールアドレス */
    private String mail = "";
    public void setMail(String mail) { this.mail = mail; }
 
    /**
     * 標準的な著作権表示HTML文を取得する
     * @return 標準的な著作権表示HTML文
     */
    public String getNormalHTML() {
        // メールアドレスが指定されている場合は著作者名にリンクをつける
       if(!mail.equals("")) {
            name = " <a href=\"mailto:" + mail + "\">" + name + "</a>";
        }
        return "Copyright " + year + " " + name + ". All rights reserved.";
    }
 
    /**
     * 短い著作権表示HTML文を取得する
     * @return 短い著作権表示HTML文
     */
    public String getShortHTML() {
        // メールアドレスが指定されている場合は著作者名にリンクをつける
        if(!mail.equals("")) {
            name = " <a href=\"mailto:" + mail + "\">" + name + "</a>";
        }
        return "(C) " + year + " " + name + ".";
    }
}