/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;

/**
 *
 * @author ShariacHung
 */
abstract public class SupermarketManagerDAO<EntityType, KeyType>  {
    abstract public void insert(EntityType entity);
    abstract public void update(EntityType entity);
    abstract public void delete(KeyType id);
    abstract public EntityType selectById(KeyType id);
    abstract public List<EntityType> selectAll();
    abstract protected List<EntityType> selectBySql(String sql, Object...args);
}
