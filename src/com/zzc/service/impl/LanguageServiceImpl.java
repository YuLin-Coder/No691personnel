package com.zzc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzc.dao.LanguageMapper;
import com.zzc.dao.UserMapper;
import com.zzc.model.Language;
import com.zzc.model.LanguageExample;
import com.zzc.model.User;
import com.zzc.model.UserExample;
import com.zzc.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class LanguageServiceImpl implements LanguageService {
    @Autowired
    private LanguageMapper languageMapper;
    @Autowired
    private UserMapper userMapper;

    public PageInfo<Language> selectLanguageByExample(Integer pageNum, Language language) {
        List<Language> languages = languageMapper.selectByExample(new LanguageExample());
        return new PageInfo<Language>(languages);
    }

    @Transactional(readOnly = false)
    public int insertLanguage(Language language) {
        return languageMapper.insert(language);
    }

    @Transactional(readOnly = false)
    public int insertLanguageSelective(Language language) {
        return languageMapper.insertSelective(language);
    }

    @Transactional(readOnly = false)
    public int updateLanguageById(Language language) {
        return languageMapper.updateByPrimaryKey(language);
    }

    @Transactional(readOnly = false)
    public int updateLanguageByIdSelective(Language language) {
        return languageMapper.updateByPrimaryKeySelective(language);
    }

    @Transactional(readOnly = false)
    public int deleteLanguageById(Integer languageid) {
        return languageMapper.deleteByPrimaryKey(languageid);
    }

    @Transactional(readOnly = false)
    public Language selectLanguageById(Integer languageid) {
        return languageMapper.selectByPrimaryKey(languageid);
    }

    public PageInfo<Language> list(Integer pageNum, Language language) {
        PageHelper.startPage(pageNum, 10);
        List<Language> languages = languageMapper.list(language);
        PageInfo<Language> info = new PageInfo<Language>(languages);
        return info;
    }

    public PageInfo<User> listAllUser() {
        List<User> users = userMapper.selectByExample(new UserExample());
        return new PageInfo<User>(users);
    }

}
