/*
 * Interface wrapper code.
 *
 * Generated by SIP 4.16.5 on Thu Feb 05 16:17:22 2015
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

#line 26 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\sip/QtCore/qbytearraymatcher.sip"
#include <qbytearraymatcher.h>
#line 29 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\QtCore/sipQtCoreQByteArrayMatcher.cpp"

#line 32 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\sip/QtCore/qbytearray.sip"
#include <qbytearray.h>
#line 33 "C:\\Users\\marcus\\Downloads\\PyQt-gpl-5.4\\PyQt-gpl-5.4\\QtCore/sipQtCoreQByteArrayMatcher.cpp"


PyDoc_STRVAR(doc_QByteArrayMatcher_setPattern, "QByteArrayMatcher.setPattern(QByteArray)");

extern "C" {static PyObject *meth_QByteArrayMatcher_setPattern(PyObject *, PyObject *);}
static PyObject *meth_QByteArrayMatcher_setPattern(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const QByteArray* a0;
        int a0State = 0;
        QByteArrayMatcher *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "BJ1", &sipSelf, sipType_QByteArrayMatcher, &sipCpp, sipType_QByteArray, &a0, &a0State))
        {
            sipCpp->setPattern(*a0);
            sipReleaseType(const_cast<QByteArray *>(a0),sipType_QByteArray,a0State);

            Py_INCREF(Py_None);
            return Py_None;
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QByteArrayMatcher, sipName_setPattern, doc_QByteArrayMatcher_setPattern);

    return NULL;
}


PyDoc_STRVAR(doc_QByteArrayMatcher_indexIn, "QByteArrayMatcher.indexIn(QByteArray, int from=0) -> int");

extern "C" {static PyObject *meth_QByteArrayMatcher_indexIn(PyObject *, PyObject *, PyObject *);}
static PyObject *meth_QByteArrayMatcher_indexIn(PyObject *sipSelf, PyObject *sipArgs, PyObject *sipKwds)
{
    PyObject *sipParseErr = NULL;

    {
        const QByteArray* a0;
        int a0State = 0;
        int a1 = 0;
        const QByteArrayMatcher *sipCpp;

        static const char *sipKwdList[] = {
            NULL,
            sipName_from,
        };

        if (sipParseKwdArgs(&sipParseErr, sipArgs, sipKwds, sipKwdList, NULL, "BJ1|i", &sipSelf, sipType_QByteArrayMatcher, &sipCpp, sipType_QByteArray, &a0, &a0State, &a1))
        {
            int sipRes;

            sipRes = sipCpp->indexIn(*a0,a1);
            sipReleaseType(const_cast<QByteArray *>(a0),sipType_QByteArray,a0State);

            return SIPLong_FromLong(sipRes);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QByteArrayMatcher, sipName_indexIn, doc_QByteArrayMatcher_indexIn);

    return NULL;
}


PyDoc_STRVAR(doc_QByteArrayMatcher_pattern, "QByteArrayMatcher.pattern() -> QByteArray");

extern "C" {static PyObject *meth_QByteArrayMatcher_pattern(PyObject *, PyObject *);}
static PyObject *meth_QByteArrayMatcher_pattern(PyObject *sipSelf, PyObject *sipArgs)
{
    PyObject *sipParseErr = NULL;

    {
        const QByteArrayMatcher *sipCpp;

        if (sipParseArgs(&sipParseErr, sipArgs, "B", &sipSelf, sipType_QByteArrayMatcher, &sipCpp))
        {
            QByteArray*sipRes;

            sipRes = new QByteArray(sipCpp->pattern());

            return sipConvertFromNewType(sipRes,sipType_QByteArray,NULL);
        }
    }

    /* Raise an exception if the arguments couldn't be parsed. */
    sipNoMethod(sipParseErr, sipName_QByteArrayMatcher, sipName_pattern, doc_QByteArrayMatcher_pattern);

    return NULL;
}


/* Cast a pointer to a type somewhere in its superclass hierarchy. */
extern "C" {static void *cast_QByteArrayMatcher(void *, const sipTypeDef *);}
static void *cast_QByteArrayMatcher(void *ptr, const sipTypeDef *targetType)
{
    if (targetType == sipType_QByteArrayMatcher)
        return ptr;

    return NULL;
}


/* Call the instance's destructor. */
extern "C" {static void release_QByteArrayMatcher(void *, int);}
static void release_QByteArrayMatcher(void *sipCppV,int)
{
    delete reinterpret_cast<QByteArrayMatcher *>(sipCppV);
}


extern "C" {static void assign_QByteArrayMatcher(void *, SIP_SSIZE_T, const void *);}
static void assign_QByteArrayMatcher(void *sipDst, SIP_SSIZE_T sipDstIdx, const void *sipSrc)
{
    reinterpret_cast<QByteArrayMatcher *>(sipDst)[sipDstIdx] = *reinterpret_cast<const QByteArrayMatcher *>(sipSrc);
}


extern "C" {static void *array_QByteArrayMatcher(SIP_SSIZE_T);}
static void *array_QByteArrayMatcher(SIP_SSIZE_T sipNrElem)
{
    return new QByteArrayMatcher[sipNrElem];
}


extern "C" {static void *copy_QByteArrayMatcher(const void *, SIP_SSIZE_T);}
static void *copy_QByteArrayMatcher(const void *sipSrc, SIP_SSIZE_T sipSrcIdx)
{
    return new QByteArrayMatcher(reinterpret_cast<const QByteArrayMatcher *>(sipSrc)[sipSrcIdx]);
}


extern "C" {static void dealloc_QByteArrayMatcher(sipSimpleWrapper *);}
static void dealloc_QByteArrayMatcher(sipSimpleWrapper *sipSelf)
{
    if (sipIsPyOwned(sipSelf))
    {
        release_QByteArrayMatcher(sipGetAddress(sipSelf),0);
    }
}


extern "C" {static void *init_type_QByteArrayMatcher(sipSimpleWrapper *, PyObject *, PyObject *, PyObject **, PyObject **, PyObject **);}
static void *init_type_QByteArrayMatcher(sipSimpleWrapper *, PyObject *sipArgs, PyObject *sipKwds, PyObject **sipUnused, PyObject **, PyObject **sipParseErr)
{
    QByteArrayMatcher *sipCpp = 0;

    {
        if (sipParseKwdArgs(sipParseErr, sipArgs, sipKwds, NULL, sipUnused, ""))
        {
            sipCpp = new QByteArrayMatcher();

            return sipCpp;
        }
    }

    {
        const QByteArray* a0;
        int a0State = 0;

        if (sipParseKwdArgs(sipParseErr, sipArgs, sipKwds, NULL, sipUnused, "J1", sipType_QByteArray, &a0, &a0State))
        {
            sipCpp = new QByteArrayMatcher(*a0);
            sipReleaseType(const_cast<QByteArray *>(a0),sipType_QByteArray,a0State);

            return sipCpp;
        }
    }

    {
        const QByteArrayMatcher* a0;

        if (sipParseKwdArgs(sipParseErr, sipArgs, sipKwds, NULL, sipUnused, "J9", sipType_QByteArrayMatcher, &a0))
        {
            sipCpp = new QByteArrayMatcher(*a0);

            return sipCpp;
        }
    }

    return NULL;
}


static PyMethodDef methods_QByteArrayMatcher[] = {
    {SIP_MLNAME_CAST(sipName_indexIn), (PyCFunction)meth_QByteArrayMatcher_indexIn, METH_VARARGS|METH_KEYWORDS, SIP_MLDOC_CAST(doc_QByteArrayMatcher_indexIn)},
    {SIP_MLNAME_CAST(sipName_pattern), meth_QByteArrayMatcher_pattern, METH_VARARGS, SIP_MLDOC_CAST(doc_QByteArrayMatcher_pattern)},
    {SIP_MLNAME_CAST(sipName_setPattern), meth_QByteArrayMatcher_setPattern, METH_VARARGS, SIP_MLDOC_CAST(doc_QByteArrayMatcher_setPattern)}
};

PyDoc_STRVAR(doc_QByteArrayMatcher, "\1QByteArrayMatcher()\n"
    "QByteArrayMatcher(QByteArray)\n"
    "QByteArrayMatcher(QByteArrayMatcher)");


pyqt5ClassTypeDef sipTypeDef_QtCore_QByteArrayMatcher = {
{
    {
        -1,
        0,
        0,
        SIP_TYPE_SUPER_INIT|SIP_TYPE_CLASS,
        sipNameNr_QByteArrayMatcher,
        {0}
    },
    {
        sipNameNr_QByteArrayMatcher,
        {0, 0, 1},
        3, methods_QByteArrayMatcher,
        0, 0,
        0, 0,
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    },
    doc_QByteArrayMatcher,
    sipNameNr_PyQt5_QtCore_pyqtWrapperType,
    sipNameNr_sip_simplewrapper,
    0,
    0,
    init_type_QByteArrayMatcher,
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
    dealloc_QByteArrayMatcher,
    assign_QByteArrayMatcher,
    array_QByteArrayMatcher,
    copy_QByteArrayMatcher,
    release_QByteArrayMatcher,
    cast_QByteArrayMatcher,
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