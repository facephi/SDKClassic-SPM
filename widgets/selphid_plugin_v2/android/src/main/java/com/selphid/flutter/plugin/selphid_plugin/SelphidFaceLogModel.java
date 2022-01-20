package com.selphid.flutter.plugin.selphid_plugin;

import java.util.HashMap;
import androidx.lifecycle.MutableLiveData;

public class SelphidFaceLogModel {
    private static SelphidFaceLogModel mLogModelInstance;
    // Create a LiveData with a String
    private MutableLiveData<HashMap<String, String>> currentLog;

    public static SelphidFaceLogModel getLogModel() {
        //instantiate a new CustomerLab if we didn't instantiate one yet
        if (mLogModelInstance == null) {
            mLogModelInstance = new SelphidFaceLogModel();
        }
        return mLogModelInstance;
    }

    public void setCurrentLogJSON(String time, String type, String info) {
        HashMap<String, String> logMap = new HashMap<>();
        logMap.put("time", time);
        logMap.put("type", type);
        logMap.put("info", info);
        currentLog.postValue(logMap); // This type must match TypeToken
    }

    public MutableLiveData<HashMap<String, String>> getCurrentLog() {
        if (currentLog == null) {
            currentLog = new MutableLiveData<HashMap<String, String>>();
        }
        return currentLog;
    }
}