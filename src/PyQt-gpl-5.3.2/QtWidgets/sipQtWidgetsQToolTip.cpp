/*
 * Interface wrapper code.
 *
 * Generated by SIP 4.16.3 on Thu Sep 18 06:18:31 2014
 *
 * Copyright (c) 2014 Riverbank Computing Limited <info@riverbankcomputing.com>
 * 
 * This file is part of PyQt5.
 * 
 * This file may be used under the terms of the GNU General Public License
 * version 3.0 as published by the Free Software Foundation and appearing in
 * the file LICENSE included in the packaging of this file.  Please review the
 * following information to ensure the GNU General Public License version 3.0
 * requirements will be met: http://www.gnu.org/copyleft/gpl.html.
 * 
 * If you do not wish to use this file under the terms of the GPL version 3.0
 * then you may purchase a commercial license.  For more information contact
 * info@riverbankcomputing.com.
 * 
 * This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 */

#include "sipAPIQtWidgets.h"

#line 26 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\sip/QtWidgets/qtooltip.sip"
#include <qtooltip.h>
#line 29 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtWidgets/sipQtWidgetsQToolTip.cpp"

#line 27 "sip/QtCore/qstring.sip"
#include <qstring.h>
#line 33 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtWidgets/sipQtWidgetsQToolTip.cpp"
#line 30 "sip/QtGui/qfont.sip"
#include <qfont.h>
#line 36 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtWidgets/sipQtWidgetsQToolTip.cpp"
#line 30 "sip/QtGui/qpalette.sip"
#include <qpalette.h>
#line 39 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtWidgets/sipQtWidgetsQToolTip.cpp"
#line 30 "sip/QtCore/qpoint.sip"
#include <qpoint.h>
#line 42 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtWidgets/sipQtWidgetsQToolTip.cpp"
#line 30 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\sip/QtWidgets/qwidget.sip"
#include <qwidget.h>
#line 45 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtWidgets/sipQtWidgetsQToolTip.cpp"
#line 30 "sip/QtCore/qrect.sip"
#include <qrect.h>
#line 48 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtWidgets/sipQtWidgetsQToolTip.cpp"


PyDoc_STRVAR(doc_QToolTip_showText, "QToolTip.showText(QPoint, str, QWidget widget=None)\n"
    "QToolTip.showText(QPoint, str, QWidget, QRect)\n"
    "QToolTip.showText(QPoint, str, QWidget, QRect, int)");

extern "C" {static PyObject *meth_QToolTip_showText(PyObject *, PyObject *, PyObject *);}
static PyObject *meth_QToolTip_showText(PyObject *, PyObject *sipArgs, PyObject *sipKwds)
{
    PyObject *sipParseErr = NULL;

    {
        const QPoint* a0;
        const QString* a1;
        int a1State = 0;
        QWidget* a2 = 0;

        static const char *sipKwdList[] = {
            NULL,
            NULL,
            sipName_widget,
        };

        if (sipParseKwdArgs(&sipParseErr, sipArgs, sipKwds, sipKwdList, NULL, "J9J1|J8", sipType_QPoint, &a0, sipType_QString,&a1, &a1State, sipType_QWidget, &a2))
        {
            QToolTip::showText(*a0,*a1,a2);
            sipReleaseType(const_cast<QString *>(a1),sipType_QString,a1State);

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    {
        const QPoint* a0;
        const QString* a1;
        int a1State = 0;
        QWidget* a2;
        const QRect* a3;

        if (sipParseKwdArgs(&sipParseErr, sipArgs, sipKwds, NULL, NULL, "J9J1J8J9", sipType_QPoint, &a0, sipType_QString,&a1, &a1State, sipType_QWidget, &a2, sipType_QRect, &a3))
        {
            QToolTip::showText(*a0,*a1,a2,*a3);
            sipReleaseType(const_cast<QString *>(a1),sipType_QString,a1State);

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    {
        const QPoint* a0;
        const QString* a1;
        int a1State = 0;
        QWidget* a2;
        const QRect* a3;
        int a4;

        if (sipParseKwdArgs(&sipParseErr, sipArgs, sipKwds, NULL, NULL, "J9J1J8J9i", sipType_QPoint, &a0, sipType_QString,&a1, &a1State, sipType_QWidget, &a2, sipType_QRect, &a3, &a4))
        {
            QToolTip::showText(*a0,*a1,a2,*a3,a4);
            sipReleaseType(const_cast<QString *>(a1),sipType_QString,a1State);

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_showText, doc_QToolTip_showText);

    return NULL;
}


PyDoc_STRVAR(doc_QToolTip_palette, "QToolTip.palette() -> QPalette");

extern "C" {static PyObject *meth_QToolTip_palette(PyObject *, PyObject *);}
static PyObject *meth_QToolTip_palette(PyObject *, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        if (sipParseArgs(&sipParseErr, sipArgs, ""))
        {
            QPalette*sipRes;

            sipRes = new QPalette(QToolTip::palette());

            return sipConvertFromNewType(sipRes,sipType_QPalette,NULL);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_palette, doc_QToolTip_palette);

    return NULL;
}


PyDoc_STRVAR(doc_QToolTip_hideText, "QToolTip.hideText()");

extern "C" {static PyObject *meth_QToolTip_hideText(PyObject *, PyObject *);}
static PyObject *meth_QToolTip_hideText(PyObject *, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        if (sipParseArgs(&sipParseErr, sipArgs, ""))
        {
            QToolTip::hideText();

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_hideText, doc_QToolTip_hideText);

    return NULL;
}


PyDoc_STRVAR(doc_QToolTip_setPalette, "QToolTip.setPalette(QPalette)");

extern "C" {static PyObject *meth_QToolTip_setPalette(PyObject *, PyObject *);}
static PyObject *meth_QToolTip_setPalette(PyObject *, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const QPalette* a0;

        if (sipParseArgs(&sipParseErr, sipArgs, "J9", sipType_QPalette, &a0))
        {
            QToolTip::setPalette(*a0);

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_setPalette, doc_QToolTip_setPalette);

    return NULL;
}


PyDoc_STRVAR(doc_QToolTip_font, "QToolTip.font() -> QFont");

extern "C" {static PyObject *meth_QToolTip_font(PyObject *, PyObject *);}
static PyObject *meth_QToolTip_font(PyObject *, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        if (sipParseArgs(&sipParseErr, sipArgs, ""))
        {
            QFont*sipRes;

            sipRes = new QFont(QToolTip::font());

            return sipConvertFromNewType(sipRes,sipType_QFont,NULL);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_font, doc_QToolTip_font);

    return NULL;
}


PyDoc_STRVAR(doc_QToolTip_setFont, "QToolTip.setFont(QFont)");

extern "C" {static PyObject *meth_QToolTip_setFont(PyObject *, PyObject *);}
static PyObject *meth_QToolTip_setFont(PyObject *, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const QFont* a0;

        if (sipParseArgs(&sipParseErr, sipArgs, "J9", sipType_QFont, &a0))
        {
            QToolTip::setFont(*a0);

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_setFont, doc_QToolTip_setFont);

    return NULL;
}


PyDoc_STRVAR(doc_QToolTip_isVisible, "QToolTip.isVisible() -> bool");

extern "C" {static PyObject *meth_QToolTip_isVisible(PyObject *, PyObject *);}
static PyObject *meth_QToolTip_isVisible(PyObject *, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        if (sipParseArgs(&sipParseErr, sipArgs, ""))
        {
            bool sipRes;

            sipRes = QToolTip::isVisible();

            return PyBool_FromLong(sipRes);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_isVisible, doc_QToolTip_isVisible);

    return NULL;
}


PyDoc_STRVAR(doc_QToolTip_text, "QToolTip.text() -> str");

extern "C" {static PyObject *meth_QToolTip_text(PyObject *, PyObject *);}
static PyObject *meth_QToolTip_text(PyObject *, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        if (sipParseArgs(&sipParseErr, sipArgs, ""))
        {
            QString*sipRes;

            sipRes = new QString(QToolTip::text());

            return sipConvertFromNewType(sipRes,sipType_QString,NULL);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QToolTip, sipName_text, doc_QToolTip_text);

    return NULL;
}


/* Cast a pointer to a type somewhere in its superclass hierarchy. */
extern "C" {static void *cast_QToolTip(void *, const sipTypeDef *);}
static void *cast_QToolTip(void *ptr, const sipTypeDef *targetType)
{
    if (targetType == sipType_QToolTip)
        return ptr;

    return NULL;
}


/* Call the instance's destructor. */
extern "C" {static void release_QToolTip(void *, int);}
static void release_QToolTip(void *sipCppV,int)
{
    delete reinterpret_cast<QToolTip *>(sipCppV);
}


extern "C" {static void dealloc_QToolTip(sipSimpleWrapper *);}
static void dealloc_QToolTip(sipSimpleWrapper *sipSelf)
{
    if (sipIsPyOwned(sipSelf))
    {
        release_QToolTip(sipGetAddress(sipSelf),0);
    }
}


static PyMethodDef methods_QToolTip[] = {
    {SIP_MLNAME_CAST(sipName_font), meth_QToolTip_font, METH_VARARGS, SIP_MLDOC_CAST(doc_QToolTip_font)},
    {SIP_MLNAME_CAST(sipName_hideText), meth_QToolTip_hideText, METH_VARARGS, SIP_MLDOC_CAST(doc_QToolTip_hideText)},
    {SIP_MLNAME_CAST(sipName_isVisible), meth_QToolTip_isVisible, METH_VARARGS, SIP_MLDOC_CAST(doc_QToolTip_isVisible)},
    {SIP_MLNAME_CAST(sipName_palette), meth_QToolTip_palette, METH_VARARGS, SIP_MLDOC_CAST(doc_QToolTip_palette)},
    {SIP_MLNAME_CAST(sipName_setFont), meth_QToolTip_setFont, METH_VARARGS, SIP_MLDOC_CAST(doc_QToolTip_setFont)},
    {SIP_MLNAME_CAST(sipName_setPalette), meth_QToolTip_setPalette, METH_VARARGS, SIP_MLDOC_CAST(doc_QToolTip_setPalette)},
    {SIP_MLNAME_CAST(sipName_showText), (PyCFunction)meth_QToolTip_showText, METH_VARARGS|METH_KEYWORDS, SIP_MLDOC_CAST(doc_QToolTip_showText)},
    {SIP_MLNAME_CAST(sipName_text), meth_QToolTip_text, METH_VARARGS, SIP_MLDOC_CAST(doc_QToolTip_text)}
};


pyqt5ClassTypeDef sipTypeDef_QtWidgets_QToolTip = {
{
    {
        -1,
        0,
        0,
        SIP_TYPE_SUPER_INIT|SIP_TYPE_CLASS,
        sipNameNr_QToolTip,
        {0}
    },
    {
        sipNameNr_QToolTip,
        {0, 0, 1},
        8, methods_QToolTip,
        0, 0,
        0, 0,
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    },
    0,
    sipNameNr_PyQt5_QtCore_pyqtWrapperType,
    sipNameNr_sip_simplewrapper,
    0,
    0,
    0,
    0,
    0,
#if PY_MAJOR_VERSION >= 3
    0,
    0,
#else
    0,
    0,
    0,
    0,
#endif
    dealloc_QToolTip,
    0,
    0,
    0,
    release_QToolTip,
    cast_QToolTip,
    0,
    0,
    0,
    0,
    0,
    0
},
    0,
    0,
    0,
    0
};