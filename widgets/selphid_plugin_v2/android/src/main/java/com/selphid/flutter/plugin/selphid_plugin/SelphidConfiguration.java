package com.selphid.flutter.plugin.selphid_plugin;

import android.os.Handler;
import android.os.Looper;
import androidx.lifecycle.Observer;
import com.facephi.fphiselphidwidgetcore.WidgetSelphIDConfiguration;
import org.json.JSONObject;
import java.util.HashMap;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StringCodec;

public class SelphidConfiguration
{
    /**
     * CONSTANTS
     **/
    private static final String SELPHID_LOG_EVENT_NAME = "onSelphidLogEvent";
    private static final String SELPHID_LOG_PARAM_NAME = "selphidLogInfo";

    protected enum ConfigurationParams {
        CONF_DEBUG("debug"),
        CONF_FULLSCREEN("fullscreen"),
        CONF_FRONTAL_CAMERA_PREFERRED("frontalCameraPreferred"),
        CONF_LOCALE("locale"),
        CONF_OCR_RESULTS("tokenImageQuality"),
        CONF_RESULT_AFTER_CAPTURE("showResultAfterCapture"),
        CONF_SCAN_MODE("scanMode"),
        CONF_SPECIFIC_DATA("specificData"),
        CONF_DOCUMENT_TYPE("documentType"),
        CONF_SHOW_TUTORIAL("showTutorial"),
        CONF_TOKEN_IMAGE_QUALITY("tokenImageQuality"),
        CONF_WIDGET_TIMEOUT("timeout"),
        CONF_VIDEO_FILENAME("videoFilename"),
        CONF_DOCUMENT_MODELS("documentModels"),
        CONF_ENABLE_EVENT_LISTENER("enableWidgetEventListener"),
        CONF_GENERATE_RAW_IMAGES("generateRawImages"),
        CONF_TRANSLATIONS_CONTENT("translationsContent"),
        CONF_VIEWS_CONTENT("viewsContent"),
        CONF_CAMERA_ID("cameraId"),
        CONF_PARAMS("params");

        private final String name;

        ConfigurationParams(String name) {
            this.name = name;
        }

        public String getName() {
            return this.name;
        }
    }
    
    /**
     * Configures the user control operation and launches the activity that will execute it.
     */
    public static WidgetSelphIDConfiguration createWidgetConfiguration(String mode, String resourcesPath, String license, String ocrPreviousData, JSONObject config, BinaryMessenger messenger, FlutterActivity mFlutterActivity) throws Exception {
        try { 
            WidgetSelphIDConfiguration conf = new WidgetSelphIDConfiguration();
            conf.setLicense(license);

            for (SelphidDocumentSide documentSide : SelphidDocumentSide.values())
                if(documentSide.getName().equals(mode)) {
                    conf.setDocumentSide(documentSide.getDocumentSide());
                    conf.setWizardMode(documentSide.getIsWizardMode());
                    break;
                }
            if(!conf.getWizardMode() && ocrPreviousData != null && !ocrPreviousData.isEmpty())
                conf.setTokenPreviousCaptureData(ocrPreviousData);
            conf.setResourcesPath(resourcesPath + ".zip");
            return processJSONConfiguration(conf, ocrPreviousData, config, messenger, mFlutterActivity);
        } catch (Exception exc) {
            throw exc;
        }
    }

    /**
     * Processes the JSON input argument and sets the configuration of the User Control.
     *
     * @param hybridConfiguration ReadableMap with input JS arguments.
     * @return Configuration of the widget
     */
    private static WidgetSelphIDConfiguration processJSONConfiguration(WidgetSelphIDConfiguration widgetConfiguration, String ocrPreviousData, JSONObject hybridConfiguration, BinaryMessenger messenger, FlutterActivity mFlutterActivity) throws Exception {
        try
        {
            JSONObject actualObject = hybridConfiguration;

            if (actualObject.length() == 0) return widgetConfiguration;

            if (actualObject.has(ConfigurationParams.CONF_DEBUG.getName())) widgetConfiguration.setDebug(actualObject.getBoolean(ConfigurationParams.CONF_DEBUG.getName()));
            if (actualObject.has(ConfigurationParams.CONF_FULLSCREEN.getName())) widgetConfiguration.setFullscreen(actualObject.getBoolean(ConfigurationParams.CONF_FULLSCREEN.getName()));
            if (actualObject.has(ConfigurationParams.CONF_LOCALE.getName())) widgetConfiguration.setLocale(actualObject.getString(ConfigurationParams.CONF_LOCALE.getName()));
            if (actualObject.has(ConfigurationParams.CONF_RESULT_AFTER_CAPTURE.getName())) widgetConfiguration.setShowAfterCapture(actualObject.getBoolean(ConfigurationParams.CONF_RESULT_AFTER_CAPTURE.getName()));
            if (actualObject.has(ConfigurationParams.CONF_SHOW_TUTORIAL.getName())) widgetConfiguration.setTutorialFlag(actualObject.getBoolean(ConfigurationParams.CONF_SHOW_TUTORIAL.getName()));
            if (actualObject.has(ConfigurationParams.CONF_TOKEN_IMAGE_QUALITY.getName())) widgetConfiguration.setTokenImageQuality((float)actualObject.optDouble(ConfigurationParams.CONF_TOKEN_IMAGE_QUALITY.getName(), 0.8));
            if (actualObject.has(ConfigurationParams.CONF_SPECIFIC_DATA.getName())) widgetConfiguration.setSpecificData(actualObject.optString(ConfigurationParams.CONF_SPECIFIC_DATA.getName()));
            if (actualObject.has(ConfigurationParams.CONF_DOCUMENT_MODELS.getName())) widgetConfiguration.setDocumentModels(actualObject.optString(ConfigurationParams.CONF_DOCUMENT_MODELS.getName()));
            if (actualObject.has(ConfigurationParams.CONF_VIDEO_FILENAME.getName())) widgetConfiguration.setVideoFilename(actualObject.optString(ConfigurationParams.CONF_VIDEO_FILENAME.getName()));

            if(widgetConfiguration.getWizardMode() && ocrPreviousData != null && !ocrPreviousData.isEmpty())
                if (actualObject.has(ConfigurationParams.CONF_OCR_RESULTS.getName())) widgetConfiguration.setTokenPreviousCaptureData(ocrPreviousData);

            if (actualObject.has(ConfigurationParams.CONF_FRONTAL_CAMERA_PREFERRED.getName())) {
                boolean isFrontalCamera = actualObject.optBoolean(ConfigurationParams.CONF_FRONTAL_CAMERA_PREFERRED.getName(), true);
                if (isFrontalCamera) widgetConfiguration.setFrontFacingCameraAsPreferred();
                else widgetConfiguration.setBackFacingCameraAsPreferred();
            }

            if (actualObject.has(ConfigurationParams.CONF_ENABLE_EVENT_LISTENER.getName()) &&
                    actualObject.getBoolean(ConfigurationParams.CONF_ENABLE_EVENT_LISTENER.getName())) {
                StartEventListener(widgetConfiguration, messenger, (FlutterActivity) mFlutterActivity);
            }

            if (actualObject.has(ConfigurationParams.CONF_SCAN_MODE.getName())) {
                String scanModeParam = actualObject.optString(ConfigurationParams.CONF_SCAN_MODE.getName());
                for (SelphidScanMode scanMode : SelphidScanMode.values())
                    if(scanMode.getName().equals(scanModeParam)) {
                        widgetConfiguration.setScanMode(scanMode.getScanMode());
                        break;
                    }
            }

            if (actualObject.has(ConfigurationParams.CONF_DOCUMENT_TYPE.getName())) {
                String documentTypeParam = actualObject.optString(ConfigurationParams.CONF_DOCUMENT_TYPE.getName());
                for (SelphidDocumentType docType : SelphidDocumentType.values())
                    if(docType.getName().equals(documentTypeParam)) {
                        widgetConfiguration.setDocumentType(docType.getDocumentType());
                        break;
                    }
            }

            if (actualObject.has(ConfigurationParams.CONF_WIDGET_TIMEOUT.getName())) {
                String timeoutParam = actualObject.optString(ConfigurationParams.CONF_WIDGET_TIMEOUT.getName());
                for (SelphidWidgetTimeout timeout : SelphidWidgetTimeout.values())
                    if(timeout.getName().equals(timeoutParam)) {
                        widgetConfiguration.setTimeout(timeout.getWidgetTimeout());
                        break;
                    }
            }

            if (actualObject.has(ConfigurationParams.CONF_GENERATE_RAW_IMAGES.getName())) {
                boolean generateRawImages = actualObject.optBoolean(ConfigurationParams.CONF_GENERATE_RAW_IMAGES.getName(), false);
                widgetConfiguration.setGenerateRawImages(generateRawImages);
            }

            if (actualObject.has(ConfigurationParams.CONF_VIEWS_CONTENT.getName())) {
                String viewsContent = actualObject.optString(ConfigurationParams.CONF_VIEWS_CONTENT.getName(), "");
                if (!viewsContent.equals(""))
                    widgetConfiguration.setViewsContent(viewsContent);
            }

            if (actualObject.has(ConfigurationParams.CONF_TRANSLATIONS_CONTENT.getName())) {
                String translationsContent = actualObject.optString(ConfigurationParams.CONF_TRANSLATIONS_CONTENT.getName(), "");
                if (!translationsContent.equals(""))
                    widgetConfiguration.setTranslationsContent(translationsContent);
            }

            if (actualObject.has(ConfigurationParams.CONF_CAMERA_ID.getName())) {
                if (!actualObject.getString(ConfigurationParams.CONF_CAMERA_ID.getName()).equals("null") && !actualObject.getString(ConfigurationParams.CONF_CAMERA_ID.getName()).equals("100") && !actualObject.getString(ConfigurationParams.CONF_CAMERA_ID.getName()).equals("")) {
                    widgetConfiguration.setCameraId(actualObject.getInt(ConfigurationParams.CONF_CAMERA_ID.getName()));
                }
            }

            // Correct format -> configurationWidget.params =  {"key0": "value0", "key1": "value1", "key2": "value2"};
            // force_camera_rotation and force_input_orientation posible values: 0 to 3
            // {"force_input_orientation": "1", "force_camera_rotation": "0", "swap_camera_dimensions": "true"},  
            if (actualObject.has(ConfigurationParams.CONF_PARAMS.getName())) {
                if (!actualObject.getString(ConfigurationParams.CONF_PARAMS.getName()).equals("null") && !actualObject.getString(ConfigurationParams.CONF_PARAMS.getName()).equals("")) {
                    JSONObject parameters = actualObject.getJSONObject(ConfigurationParams.CONF_PARAMS.getName());

                    for (int i = 0; i < parameters.names().length(); i++) {
                        widgetConfiguration.setParam(parameters.names().getString(i), String.valueOf(parameters.get(parameters.names().getString(i))));
                    }
                }
            }
        }
        catch(Exception exc) {
            throw exc;
        }
        return widgetConfiguration;
    }

    private static void StartEventListener(WidgetSelphIDConfiguration widgetConfiguration, final BinaryMessenger messenger, final FlutterActivity mFlutterActivity) {
        widgetConfiguration.setIFPhiWidgetSelphIDEventListener_classname("com.selphid.flutter.plugin.selphid_plugin.SelphidEventListener");
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                SelphidFaceLogModel.getLogModel().getCurrentLog().observe(mFlutterActivity, new Observer<HashMap<String, String>>() {
                    @Override
                    public void onChanged(HashMap<String, String> logData) {
                        JSONObject jsonObject = new JSONObject(logData);

                        BasicMessageChannel channel = new BasicMessageChannel(messenger, SELPHID_LOG_EVENT_NAME, StringCodec.INSTANCE);
                        channel.send(jsonObject.toString());
                    }
                });
            }
        });
    }
}