package com.facephi.bridge_plugin.sdkManager

import com.facephi.bridge_plugin.sdkmanager.internalSdkManager.SdkManager
import io.mockk.mockkClass


internal class FacephiSdkManagerTest {

    private val mockSdkManager: SdkManager = mockkClass(
        SdkManager::class, "SdkManager", true
    )


    fun launchSelphi() {
    }


    fun initSession() {
    }


    fun initProcess() {
    }


    fun launchSelphId() {
    }


    fun launchTracking() {
    }


    fun generateRawTemplate() {
    }


    fun tokenize() {
    }


    fun setCustomerId() {
    }
}