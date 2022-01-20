package com.selphid.flutter.plugin.selphid_plugin;

import com.facephi.fphiselphidwidgetcore.WidgetSelphIDDocumentType;

public enum SelphidDocumentType {
    DT_IDCARD("DT_IDCard") {
        @Override
        public WidgetSelphIDDocumentType getDocumentType() {
            return WidgetSelphIDDocumentType.DTIDCard;
        }
    },
    DT_PASSPORT("DT_Passport") {
        @Override
        public WidgetSelphIDDocumentType getDocumentType() {
            return WidgetSelphIDDocumentType.DTPassport;
        }
    },
    DT_DRIVE_LICENSE("DT_DriversLicense") {
        @Override
        public WidgetSelphIDDocumentType getDocumentType() {
            return WidgetSelphIDDocumentType.DTDriversLicense;
        }
    },
    DT_FOREIGN_CARD("DT_ForeignCard") {
        @Override
        public WidgetSelphIDDocumentType getDocumentType() {
            return WidgetSelphIDDocumentType.DTForeignCard;
        }
    },
    DT_CREDIT_CARD("DT_CreditCard") {
        @Override
        public WidgetSelphIDDocumentType getDocumentType() {
            return WidgetSelphIDDocumentType.DTCreditCard;
        }
    },
    DT_CUSTOM("DT_Custom") {
        @Override
        public WidgetSelphIDDocumentType getDocumentType() {
            return WidgetSelphIDDocumentType.DTCustom;
        }
    };

    private final String name;

    SelphidDocumentType(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public abstract WidgetSelphIDDocumentType getDocumentType();
}
