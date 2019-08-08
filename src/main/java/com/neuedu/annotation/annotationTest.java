package com.neuedu.annotation;

import com.neuedu.pojo.UserInfo;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class annotationTest {
    public static void main(String[] args) {
        UserInfo userInfo=new UserInfo();
        userInfo.setUsername("aa");
        userInfo.setPassword("1234");
        userInfo.setEmail("111@qq.com");
        System.out.println(query(userInfo));
    }
    private static String query(Object object) {
        StringBuffer sql=new StringBuffer();
        sql.append("");
        try {
            Class c = object.getClass();
            boolean isexistsTableAnnotation = c.isAnnotationPresent(Table.class);
            if (isexistsTableAnnotation) {
                Table table = (Table) c.getAnnotation(Table.class);
                System.out.println(table.value());
                sql.append("select * ").append("from ").append(table.value()).append(" where 1=1");
            }
            Field[] fields = c.getDeclaredFields();
            for (Field field : fields) {
                String getMethodName = "";
                field.getName();
                boolean iscolumnAnotation = field.isAnnotationPresent(Column.class);
                if (iscolumnAnotation) {
                    Column column = field.getAnnotation(Column.class);
                    String columnName = column.value();
                    String name = field.getName();
                    String value = null;
                    getMethodName = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
                    Method m = c.getMethod(getMethodName);
                    value = (String) m.invoke(object);
                    if (value == null || "".equals(value)) {
                        continue;
                    } else if (value instanceof String) {
                        value = "'" + value + "'";
                    }
                    sql.append(" and ").append(columnName).append("=").append(value);
                }
            }


        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        return sql.toString();
    }
}
