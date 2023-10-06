package test.dao;

import com.example.dao.ConnectionUtil;
import com.example.dao.TodoDAO;
import com.example.domain.TodoVO;
import lombok.Cleanup;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class TodoDAOTests {
    private TodoDAO todoDAO;

    @BeforeEach
    public void ready() {
        todoDAO = new TodoDAO();
    }

    @Test
    public void testTime() throws Exception {
        System.out.println(todoDAO.getTime());
    }

    @Test
    public String getWithPassword() throws SQLException {
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement("select now()");
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        resultSet.next();
        String now = resultSet.getString(1);
        return now;
    }

    @Test
    public void testInsert() throws Exception {
        TodoVO todoVO = TodoVO.builder()
                .title("Sample Title...")
                .dueDate(LocalDate.of(2021, 12, 31))
                .build();
        todoDAO.insert(todoVO);
    }

    @Test
    public void testSelectAll() throws Exception {
        List<TodoVO> list = todoDAO.selectAll();

        // 1) 람다와 스트링 이용해서 출력
        list.forEach(todoVO -> System.out.println(todoVO));

        // 2) forEach 사용
        for (TodoVO todoVO : list) {
            System.out.println(todoVO);
        }
    }

    @Test
    public void testSelectOne() throws Exception {
        TodoVO todoVO = todoDAO.selectOne(1);
        System.out.println(todoVO);

    }

    @Test
    public void testDeleteOne() throws Exception {
        todoDAO.deleteOne(2L);

    }

    @Test
    public void testUpdateOne() throws Exception {
        long tno = 1L;
        TodoVO todoVO = TodoVO.builder()
                .tno(tno)
                .title("Update Sample Title...")
                .dueDate(LocalDate.of(2021, 12, 31))
                .build();
        todoDAO.updateOne(todoVO);
        System.out.println(todoDAO.selectOne(tno));
    }


}
