//package dao;
//
//import com.mysql.cj.jdbc.MysqlDataSource;
//import org.jdbi.v3.core.Jdbi;
//
//import java.sql.SQLException;
//
//public class BaseDAO {
//    private static Jdbi jdbi;
//
//    protected Jdbi get(){
//        if (jdbi == null){
//            makeConnect();
//        }
//        return jdbi;
//    }
//    private void makeConnect(){
//        MysqlDataSource src = new MysqlDataSource();
//        String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();
//        src.setURL(url);
//        src.setUser(DBProperties.username());
//        src.setPassword(DBProperties.password());
//
//
//        try{
//            src.setUseCompression(true);
//            src.setAutoReconnect(true);
//        }catch (SQLException e){
//            throw new RuntimeException(e);
//        }
//        jdbi = Jdbi.create(src);
//    }
//
//    public static void main(String[] args) {
//        BaseDAO dao = new BaseDAO();
//        dao.get();
//    }
//}
