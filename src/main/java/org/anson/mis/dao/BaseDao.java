package org.anson.mis.dao;

import org.anson.mis.entity.Example;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 通用单表操作
 * @param <T>
 */
public interface BaseDao<T> {
    /**
     * 根据主键id查询
     * @param id
     * @return
     */
    public T selById(Long id);

    /**
     * 根据主键id查询
     * @param list
     * @return
     */
    public List<T> selByIdList(List<T> list);

    /**
     * 根据主键id列表查询
     * @param ids
     * @return
     */
    public List<T> selByIdArray(Long[] ids);

    /**
     * 根据 example 查询
     * @param example
     * @return
     */
    public List<T> selByExample(Example example);

    /**
     * 根据 example 统计记录数
     * @param example
     * @return
     */
    public Long countByExample(Example example);

    /**
     * 插入
     * @param t
     */
    public void insert(T t);

    /**
     * 插入多条记录
     * @param list
     */
    public void insertList(List<T> list);

    /**
     * 根据 主键id 更新
     * @param id
     */
    public void updateById(Long id);

    /**
     * 根据 主键id 更新 不为空的列
     * @param id
     */
    public void updateByIdSelective(Long id);

    /**
     * 根据 example 更新
     * @param example
     * @param t
     */
    public void updateByExample(@Param("record") T t, @Param("example") Example example);

    /**
     * 根据 example 更新 不为空的列
     * @param example
     * @param t
     */
    public void updateByExampleSelective(@Param("record") T t, @Param("example") Example example);

    /**
     * 根据主键id删除
     * @param id
     */
    public void delById(Long id);

    /**
     * 根据主键id list 删除
     * @param list
     */
    public void delByIdList(List<T> list);

    /**
     * 根据主键id 数组 删除
     * @param ids
     */
    public void delByIdArray(Long[] ids);
}
