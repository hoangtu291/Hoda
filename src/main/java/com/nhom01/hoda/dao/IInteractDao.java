/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nhom01.hoda.dao;

import com.nhom01.hoda.model.InteractModel;
import com.nhom01.hoda.model.PostModel;
import java.util.List;

public interface IInteractDao {
    public long save(InteractModel interactModel);
    public List<InteractModel> getAllInteractOfPost(long pid);
    public void delete(Long interactid);
    
    
    
    public void deleteAllInteractOfPost(long pid);
}
