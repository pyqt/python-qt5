/*
 * Interface wrapper code.
 *
 * Generated by SIP 4.16.3 on Thu Sep 18 06:17:41 2014
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

#include "sipAPIQtCore.h"

#line 54 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\sip/QtCore/qlogging.sip"
#include <qlogging.h>
#line 29 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtCore/sipQtCoreQMessageLogger.cpp"



PyDoc_STRVAR(doc_QMessageLogger_debug, "QMessageLogger.debug(str)");

extern "C" {static PyObject *meth_QMessageLogger_debug(PyObject *, PyObject *);}
static PyObject *meth_QMessageLogger_debug(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const char* a0;
        const QMessageLogger *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "Bs", &sipSelf, sipType_QMessageLogger, &sipCpp, &a0))
        {
#line 65 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\sip/QtCore/qlogging.sip"
        Py_BEGIN_ALLOW_THREADS
        sipCpp->debug("%s", a0);
        Py_END_ALLOW_THREADS
#line 50 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtCore/sipQtCoreQMessageLogger.cpp"

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QMessageLogger, sipName_debug, doc_QMessageLogger_debug);

    return NULL;
}


PyDoc_STRVAR(doc_QMessageLogger_warning, "QMessageLogger.warning(str)");

extern "C" {static PyObject *meth_QMessageLogger_warning(PyObject *, PyObject *);}
static PyObject *meth_QMessageLogger_warning(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const char* a0;
        const QMessageLogger *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "Bs", &sipSelf, sipType_QMessageLogger, &sipCpp, &a0))
        {
#line 72 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\sip/QtCore/qlogging.sip"
        Py_BEGIN_ALLOW_THREADS
        sipCpp->warning("%s", a0);
        Py_END_ALLOW_THREADS
#line 81 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtCore/sipQtCoreQMessageLogger.cpp"

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QMessageLogger, sipName_warning, doc_QMessageLogger_warning);

    return NULL;
}


PyDoc_STRVAR(doc_QMessageLogger_critical, "QMessageLogger.critical(str)");

extern "C" {static PyObject *meth_QMessageLogger_critical(PyObject *, PyObject *);}
static PyObject *meth_QMessageLogger_critical(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const char* a0;
        const QMessageLogger *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "Bs", &sipSelf, sipType_QMessageLogger, &sipCpp, &a0))
        {
#line 79 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\sip/QtCore/qlogging.sip"
        Py_BEGIN_ALLOW_THREADS
        sipCpp->critical("%s", a0);
        Py_END_ALLOW_THREADS
#line 112 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtCore/sipQtCoreQMessageLogger.cpp"

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QMessageLogger, sipName_critical, doc_QMessageLogger_critical);

    return NULL;
}


PyDoc_STRVAR(doc_QMessageLogger_fatal, "QMessageLogger.fatal(str)");

extern "C" {static PyObject *meth_QMessageLogger_fatal(PyObject *, PyObject *);}
static PyObject *meth_QMessageLogger_fatal(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const char* a0;
        const QMessageLogger *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "Bs", &sipSelf, sipType_QMessageLogger, &sipCpp, &a0))
        {
#line 86 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\sip/QtCore/qlogging.sip"
        Py_BEGIN_ALLOW_THREADS
        sipCpp->fatal("%s", a0);
        Py_END_ALLOW_THREADS
#line 143 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.3.2\\QtCore/sipQtCoreQMessageLogger.cpp"

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QMessageLogger, sipName_fatal, doc_QMessageLogger_fatal);

    return NULL;
}


/* Cast a pointer to a type somewhere in its superclass hierarchy. */
extern "C" {static void *cast_QMessageLogger(void *, const sipTypeDef *);}
static void *cast_QMessageLogger(void *ptr, const sipTypeDef *targetType)
{
    if (targetType == sipType_QMessageLogger)
        return ptr;

    return NULL;
}


/* Call the instance's destructor. */
extern "C" {static void release_QMessageLogger(void *, int);}
static void release_QMessageLogger(void *sipCppV,int)
{
    delete reinterpret_cast<QMessageLogger *>(sipCppV);
}


extern "C" {static void dealloc_QMessageLogger(sipSimpleWrapper *);}
static void dealloc_QMessageLogger(sipSimpleWrapper *sipSelf)
{
    if (sipIsPyOwned(sipSelf))
    {
        release_QMessageLogger(sipGetAddress(sipSelf),0);
    }
}


extern "C" {static void *init_type_QMessageLogger(sipSimpleWrapper *, PyObject *, PyObject *, PyObject **, PyObject **, PyObject **);}
static void *init_type_QMessageLogger(sipSimpleWrapper *, PyObject *sipArgs, PyObject *sipKwds, PyObject **sipUnused, PyObject **, PyObject **sipParseErr)
{
    QMessageLogger *sipCpp = 0;

    {
        if (sipParseKwdArgs(sipParseErr, sipArgs, sipKwds, NULL, sipUnused, ""))
        {
            sipCpp = new QMessageLogger();

            return sipCpp;
        }
    }

    {
        const char* a0;
        int a1;
        const char* a2;

        if (sipParseKwdArgs(sipParseErr, sipArgs, sipKwds, NULL, sipUnused, "sis", &a0, &a1, &a2))
        {
            sipCpp = new QMessageLogger(a0,a1,a2);

            return sipCpp;
        }
    }

    {
        const char* a0;
        int a1;
        const char* a2;
        const char* a3;

        if (sipParseKwdArgs(sipParseErr, sipArgs, sipKwds, NULL, sipUnused, "siss", &a0, &a1, &a2, &a3))
        {
            sipCpp = new QMessageLogger(a0,a1,a2,a3);

            return sipCpp;
        }
    }

    return NULL;
}


static PyMethodDef methods_QMessageLogger[] = {
    {SIP_MLNAME_CAST(sipName_critical), meth_QMessageLogger_critical, METH_VARARGS, SIP_MLDOC_CAST(doc_QMessageLogger_critical)},
    {SIP_MLNAME_CAST(sipName_debug), meth_QMessageLogger_debug, METH_VARARGS, SIP_MLDOC_CAST(doc_QMessageLogger_debug)},
    {SIP_MLNAME_CAST(sipName_fatal), meth_QMessageLogger_fatal, METH_VARARGS, SIP_MLDOC_CAST(doc_QMessageLogger_fatal)},
    {SIP_MLNAME_CAST(sipName_warning), meth_QMessageLogger_warning, METH_VARARGS, SIP_MLDOC_CAST(doc_QMessageLogger_warning)}
};

PyDoc_STRVAR(doc_QMessageLogger, "\1QMessageLogger()\n"
    "QMessageLogger(str, int, str)\n"
    "QMessageLogger(str, int, str, str)");


pyqt5ClassTypeDef sipTypeDef_QtCore_QMessageLogger = {
{
    {
        -1,
        0,
        0,
        SIP_TYPE_SUPER_INIT|SIP_TYPE_CLASS,
        sipNameNr_QMessageLogger,
        {0}
    },
    {
        sipNameNr_QMessageLogger,
        {0, 0, 1},
        4, methods_QMessageLogger,
        0, 0,
        0, 0,
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    },
    doc_QMessageLogger,
    sipNameNr_PyQt5_QtCore_pyqtWrapperType,
    sipNameNr_sip_simplewrapper,
    0,
    0,
    init_type_QMessageLogger,
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
    dealloc_QMessageLogger,
    0,
    0,
    0,
    release_QMessageLogger,
    cast_QMessageLogger,
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