package com.selphid.flutter.plugin.selphid_plugin;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class SelphidUtils {
    /**
     * @param bitmap the bitmap image to convert
     * @param format the Compress format image to convert
     * @param quality the quality int image to convert
     * @description Compress bitmap using jpeg, convert to Base64 encoded string, and return to JavaScript.
     */
    static String processPicture(Bitmap bitmap, Bitmap.CompressFormat format, int quality) {
        if (bitmap == null)
            return null;
        try {
            ByteArrayOutputStream jpeg_data = new ByteArrayOutputStream();
            if (bitmap.compress(format, quality, jpeg_data)) {
                byte[] code = jpeg_data.toByteArray();
                byte[] output = Base64.encode(code, Base64.NO_WRAP);
                String js_out = new String(output);
                return js_out;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }

    static Bitmap getBitmapFromAsset(Context context, String filePath) throws IOException {
        try {
            AssetManager assetManager = context.getAssets();
            InputStream istr = assetManager.open(filePath);
            return BitmapFactory.decodeStream(istr);
        } catch (IOException e) {
            throw e;

        }
    }

    static Bitmap getBitmapFromBase64(String base64Image) throws IOException {
        try {
            String cleanImage = base64Image.replace("data:image/png;base64,", "").replace("data:image/jpeg;base64,", "");
            byte[] decodedString = Base64.decode(cleanImage, Base64.DEFAULT);
            return BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
        } catch (Exception e) {
            throw e;
        }
    }
}