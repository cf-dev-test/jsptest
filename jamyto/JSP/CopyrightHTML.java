package atmarkit;
 
/**
 * 著作権表示用のHTMLを生成するクラス
 */
public class CopyrightHTML {
 
    /** 著作年 */
    public String year = "";
 
    /** 著作者 */
    public String name = "";
 
    /** メールアドレス */
    public String mail = "";
 
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