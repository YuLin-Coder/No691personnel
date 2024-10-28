package com.zzc.service;

import com.github.pagehelper.PageInfo;
import com.zzc.model.Language;
import com.zzc.model.User;

/**
 * Created by zyz on 2016/11/9.
 */
public interface LanguageService {

    int deleteLanguageById(Integer languageid);

    int insertLanguage(Language language);

    int insertLanguageSelective(Language language);

    int updateLanguageById(Language language);

    int updateLanguageByIdSelective(Language language);

    Language selectLanguageById(Integer languageid);

    PageInfo<Language> selectLanguageByExample(Integer pageNum, Language language);

    PageInfo<Language> list(Integer pageNum, Language language);


    PageInfo<User> listAllUser();

}
