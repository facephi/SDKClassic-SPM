package com.facephi.bridge_plugin.sdkmanager.data.request




data class SelphIdConfigurationData(
    var debug: Boolean = false,
    var showResultAfterCapture: Boolean = true,
    var showTutorial: Boolean = false,
    var scanMode: String = SelphIDScanMode.CAP_MODE_GENERIC,
    var specificData: String = "",
    var fullscreen: Boolean = true,
    var tokenImageQuality : Double = 0.5,
    var locale: String = "",
    var documentType: String = SelphIDDocumentType.DT_IDCARD,
    var timeout: String = SelphIDTimeout.T_SHORT,
    var enableWidgetEventListener: Boolean = true,
    var generateRawImages: Boolean = false,
    var compressFormat: String = SelphIDCompressFormat.T_JPEG,
    var imageQuality : Int = 100,
    var translationsContent: String = "",
    var viewsContent: String = "",
    var documentModels: String = "",
    var license: String = ""
)

class SelphIDCompressFormat{
    companion object{
        const val T_JPEG: String = "jpeg"
        const val T_PNG: String = "png"
    }
}

class SelphIDTimeout{
    companion object{
        const val T_SHORT: String = "Short"
        const val T_MEDIUM: String = "Medium"
        const val T_LONG: String = "Long"
    }
}

class SelphIDScanMode{
    companion object{
        const val CAP_MODE_GENERIC: String = "GenericMode"
        const val CAP_MODE_SPECIFIC: String = "SpecificMode"
        const val CAP_MODE_SEARCH: String = "SearchMode"
    }
}

class SelphIDDocumentType{
    companion object{
        const val DT_IDCARD: String = "DT_IDCard"
        const val DT_PASSPORT: String = "DT_Passport"
        const val DT_DRIVERSLICENSE: String = "DT_DriversLicense"
        const val DT_FOREIGNCARD: String = "DT_ForeignCard"
        const val DT_CREDITCARD: String = "DT_CreditCard"
        const val DT_CUSTOM: String = "DT_Custom"
    }
}


