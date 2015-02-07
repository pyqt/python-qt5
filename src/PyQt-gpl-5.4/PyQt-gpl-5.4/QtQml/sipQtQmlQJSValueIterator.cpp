/*
 * Interface wrapper code.
 *
 * Generated by SIP 4.16.5 on Thu Feb 05 16:17:44 2015
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

#include "sipAPIQtQml.h"

#line 26 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\sip/QtQml/qjsvalueiterator.sip"
#include <qjsvalueiterator.h>
#line 29 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\QtQml/sipQtQmlQJSValueIterator.cpp"

#line 28 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\sip/QtQml/qjsvalue.sip"
#include <qjsvalue.h>
#line 33 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\QtQml/sipQtQmlQJSValueIterator.cpp"
#line 27 "sip/QtCore/qstring.sip"
#include <qstring.h>
#line 36 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\QtQml/sipQtQmlQJSValueIterator.cpp"


PyDoc_STRVAR(doc_QJSValueIterator_hasNext, "QJSValueIterator.hasNext() -> bool");

extern "C" {static PyObject *meth_QJSValueIterator_hasNext(PyObject *, PyObject *);}
static PyObject *meth_QJSValueIterator_hasNext(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const QJSValueIterator *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "B", &sipSelf, sipType_QJSValueIterator, &sipCpp))
        {
            bool sipRes;

            sipRes = sipCpp->hasNext();

            return PyBool_FromLong(sipRes);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QJSValueIterator, sipName_hasNext, doc_QJSValueIterator_hasNext);

    return NULL;
}


PyDoc_STRVAR(doc_QJSValueIterator_next, "QJSValueIterator.next() -> bool");

extern "C" {static PyObject *meth_QJSValueIterator_next(PyObject *, PyObject *);}
static PyObject *meth_QJSValueIterator_next(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        QJSValueIterator *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "B", &sipSelf, sipType_QJSValueIterator, &sipCpp))
        {
            bool sipRes;

            sipRes = sipCpp->next();

            return PyBool_FromLong(sipRes);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QJSValueIterator, sipName_next, doc_QJSValueIterator_next);

    return NULL;
}


PyDoc_STRVAR(doc_QJSValueIterator_name, "QJSValueIterator.name() -> str");

extern "C" {static PyObject *meth_QJSValueIterator_name(PyObject *, PyObject *);}
static PyObject *meth_QJSValueIterator_name(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const QJSValueIterator *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "B", &sipSelf, sipType_QJSValueIterator, &sipCpp))
        {
            QString*sipRes;

            sipRes = new QString(sipCpp->name());

            return sipConvertFromNewType(sipRes,sipType_QString,NULL);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QJSValueIterator, sipName_name, doc_QJSValueIterator_name);

    return NULL;
}


PyDoc_STRVAR(doc_QJSValueIterator_value, "QJSValueIterator.value() -> QJSValue");

extern "C" {static PyObject *meth_QJSValueIterator_value(PyObject *, PyObject *);}
static PyObject *meth_QJSValueIterator_value(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const QJSValueIterator *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "B", &sipSelf, sipType_QJSValueIterator, &sipCpp))
        {
            QJSValue*sipRes;

            sipRes = new QJSValue(sipCpp->value());

            return sipConvertFromNewType(sipRes,sipType_QJSValue,NULL);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QJSValueIterator, sipName_value, doc_QJSValueIterator_value);

    return NULL;
}


/* Cast a pointer to a type somewhere in its superclass hierarchy. */
extern "C" {static void *cast_QJSValueIterator(void *, const sipTypeDef *);}
static void *cast_QJSValueIterator(void *ptr, const sipTypeDef *targetType)
{
    if (targetType == sipType_QJSValueIterator)
        return ptr;

    return NULL;
}


/* Call the instance's destructor. */
extern "C" {static void release_QJSValueIterator(void *, int);}
static void release_QJSValueIterator(void *sipCppV,int)
{
    delete reinterpret_cast<QJSValueIterator *>(sipCppV);
}


extern "C" {static void dealloc_QJSValueIterator(sipSimpleWrapper *);}
static void dealloc_QJSValueIterator(sipSimpleWrapper *sipSelf)
{
    if (sipIsPyOwned(sipSelf))
    {
        release_QJSValueIterator(sipGetAddress(sipSelf),0);
    }
}


extern "C" {static void *init_type_QJSValueIterator(sipSimpleWrapper *, PyObject *, PyObject *, PyObject **, PyObject **, PyObject **);}
static void *init_type_QJSValueIterator(sipSimpleWrapper *, PyObject *sipArgs, PyObject *sipKwds, PyObject **sipUnused, PyObject **, PyObject **sipParseErr)
{
    QJSValueIterator *sipCpp = 0;

    {
        const QJSValue* a0;
        int a0State = 0;

        if (sipParseKwdArgs(sipParseErr, sipArgs, sipKwds, NULL, sipUnused, "J1", sipType_QJSValue, &a0, &a0State))
        {
            sipCpp = new QJSValueIterator(*a0);
            sipReleaseType(const_cast<QJSValue *>(a0),sipType_QJSValue,a0State);

            return sipCpp;
        }
    }

    return NULL;
}


static PyMethodDef methods_QJSValueIterator[] = {
    {SIP_MLNAME_CAST(sipName_hasNext), meth_QJSValueIterator_hasNext, METH_VARARGS, SIP_MLDOC_CAST(doc_QJSValueIterator_hasNext)},
    {SIP_MLNAME_CAST(sipName_name), meth_QJSValueIterator_name, METH_VARARGS, SIP_MLDOC_CAST(doc_QJSValueIterator_name)},
    {SIP_MLNAME_CAST(sipName_next), meth_QJSValueIterator_next, METH_VARARGS, SIP_MLDOC_CAST(doc_QJSValueIterator_next)},
    {SIP_MLNAME_CAST(sipName_value), meth_QJSValueIterator_value, METH_VARARGS, SIP_MLDOC_CAST(doc_QJSValueIterator_value)}
};

PyDoc_STRVAR(doc_QJSValueIterator, "\1QJSValueIterator(QJSValue)");


pyqt5ClassTypeDef sipTypeDef_QtQml_QJSValueIterator = {
{
    {
        -1,
        0,
        0,
        SIP_TYPE_SUPER_INIT|SIP_TYPE_CLASS,
        sipNameNr_QJSValueIterator,
        {0}
    },
    {
        sipNameNr_QJSValueIterator,
        {0, 0, 1},
        4, methods_QJSValueIterator,
        0, 0,
        0, 0,
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    },
    doc_QJSValueIterator,
    sipNameNr_PyQt5_QtCore_pyqtWrapperType,
    sipNameNr_sip_simplewrapper,
    0,
    0,
    init_type_QJSValueIterator,
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
    dealloc_QJSValueIterator,
    0,
    0,
    0,
    release_QJSValueIterator,
    cast_QJSValueIterator,
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