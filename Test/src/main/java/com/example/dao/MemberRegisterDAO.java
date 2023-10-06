package com.example.dao;

import com.example.dto.MemberDTO;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberRegisterDAO {

    private static MemberRegisterDAO instance;

    private MemberRegisterDAO() {

    }

    public static MemberRegisterDAO getInstance() {
        if (instance == null)
            instance = new MemberRegisterDAO();
        return instance;
    }

    public boolean insertMember(MemberDTO memberDTO) {
        // member 테이블에 회원 가입 하기
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = getConnection();

            String sql = "insert into member (memberEmail, passwd, memberName, phone)" +
                    "values (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, memberDTO.getMemberEmail());
            preparedStatement.setString(2, memberDTO.getPasswd());
            preparedStatement.setString(3, memberDTO.getMemberName());
            preparedStatement.setString(4, memberDTO.getPhone());
            preparedStatement.executeUpdate();

        } catch (Exception ex) {
            System.out.println("insertMember() 에러 : " + ex);
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
                if (connection != null)
                    connection.close();
            } catch (Exception ex) {
                throw new RuntimeException(ex.getMessage());
            }
        }
        return false;
    }
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection = null;

        String url = "jdbc:mariadb://localhost:3308/test0920?characterEncoding=UTF-8";
        String user = "root";
        String password = "9559";

        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);

        return connection;
    }
}



