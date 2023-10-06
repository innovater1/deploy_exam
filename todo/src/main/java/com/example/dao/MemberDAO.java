package com.example.dao;

import com.example.domain.MemberVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
    public MemberVO getWithPassword(String mid, String mpw) throws Exception {
        String sql = "select * from `tbl_member` where mid = ? and mpw = ?";
        MemberVO memberVO = null;

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, mid);
        preparedStatement.setString(2, mpw);

        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            memberVO = MemberVO.builder()
                    .mid(resultSet.getString("mid"))
                    .mpw(resultSet.getString("mpw"))
                    .mname(resultSet.getString("mname"))
                    .build();
        }
        return memberVO;
    }
    public void updateUuid(String mid, String uuid) throws Exception {
        // 자동로그인 기능을 사용해서 임의의 문자열이 생성된 경우, 해당 memberId의 데이터에 업데이트
        String sql = "update `tbl_member` set `uuid` = ? where `mid` = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, uuid);
        preparedStatement.setString(2, mid);
        preparedStatement.executeUpdate();
    }

    public MemberVO selectUuid(String uuid) throws Exception {
        String sql = "select `mid`, `mpw`, `mname`, `uuid` from `tbl_member` where `uuid` = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, uuid);

        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
        MemberVO memberVO = null;
        if (resultSet.next()) {
            memberVO = MemberVO.builder()
                    .mid(resultSet.getString("mid"))
                    .mpw(resultSet.getString("mpw"))
                    .mname(resultSet.getString("mname"))
                    .uuid(resultSet.getString("uuid"))
                    .build();
        }
        return memberVO;
    }
}
