package com.selphi.flutter.plugin.selphi_face_plugin;

import androidx.lifecycle.MutableLiveData;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.HashMap;

public class SelphiFaceLogModel {
    private static SelphiFaceLogModel mLogModelInstance;
    // Create a LiveData with a String
    private MutableLiveData<String> currentLog;

    public static SelphiFaceLogModel getLogModel() {
        //instantiate a new CustomerLab if we didn't instantiate one yet
        if (mLogModelInstance == null) {
            mLogModelInstance = new SelphiFaceLogModel();
        }
        return mLogModelInstance;
    }

    public void setCurrentLogJSON(String time, String type, String info) {

        HashMap<String, String> logMap = new HashMap<>();
        logMap.put("time", time);
        logMap.put("type", type);
        logMap.put("info", info);
        Gson gson = new Gson();
        Type typeOfHashMap = new TypeToken<HashMap<String, String>>() { }.getType();
        currentLog.postValue(gson.toJson(logMap, typeOfHashMap)); // This type must match TypeToken
    }

    public MutableLiveData<String> getCurrentLog() {
        if (currentLog == null) {
            currentLog = new MutableLiveData<String>();
        }
        return currentLog;
    }
}