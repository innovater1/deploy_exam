package com.example.dao;

import com.example.domain.TodoVO;
import lombok.Cleanup;
import org.checkerframework.checker.units.qual.C;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TodoDAO {
    public String getTime() {
        String now = null;

        try(Connection connection = ConnectionUtil.INSTANCE.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select now()");
            ResultSet resultSet = preparedStatement.executeQuery();
            ) {
            resultSet.next();
            now = resultSet.getString(1);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return now;
    }

    public void insert(TodoVO todoVO) throws Exception {
        String sql = "insert into tbl_todo (title, dueDate, finished) values (?, ?, ?)";

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, todoVO.getTitle());
        //java.sql.Date 타입을 이용해 변환해서 추가.
        preparedStatement.setDate(2, Date.valueOf(todoVO.getDueDate()));
        preparedStatement.setBoolean(3, todoVO.isFinished());
        preparedStatement.executeUpdate();
    }

    public List<TodoVO> selectAll() throws Exception {
        String sql = "select * from tbl_todo";

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        List<TodoVO> list = new ArrayList<>();
        while (resultSet.next()) {
            // 데이터베이스의 데이터를 TodoVO 객체에 저장해서 list에 추가
            TodoVO todoVO = TodoVO.builder()
                    .tno(resultSet.getLong("tno"))
                    .title(resultSet.getString("title"))
                    .dueDate(resultSet.getDate("dueDate").toLocalDate())
                    .finished(resultSet.getBoolean("finished"))
                    .build();
            list.add(todoVO);
        }
        return list;
    }
    public TodoVO selectOne(long tno) throws Exception {
        // tno를 받아서 해당 번호의 데이터를 들고 옴
        String sql = "select * from tbl_todo where tno = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, tno);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        TodoVO todoVO = null;
        if(resultSet.next()) {
            todoVO = TodoVO.builder()
                    .tno(tno)
                    .title(resultSet.getString("title"))
                    .dueDate(resultSet.getDate("dueDate").toLocalDate())
                    .finished(resultSet.getBoolean("finished"))
                    .build();
        }
        return todoVO;
    }

    public void deleteOne(long tno) throws Exception {
        // tno를 받아서 해당 번호의 데이터를 삭제
        String sql = "DELETE from tbl_todo where tno = ?";

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setLong(1, tno);
        preparedStatement.executeUpdate();
    }

    public void updateOne(TodoVO todoVO) throws Exception {
        //String sql = "UPDATE board SET name=?, subject = ?, content = ? WHERE num = ?";
        String sql = "update tbl_todo set title= ?, dueDate = ?, finished = ? where tno = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, todoVO.getTitle());
        preparedStatement.setDate(2, Date.valueOf(todoVO.getDueDate()));
        preparedStatement.setBoolean(3, todoVO.isFinished());
        preparedStatement.setLong(4, todoVO.getTno());

        preparedStatement.executeUpdate();
    }

}
