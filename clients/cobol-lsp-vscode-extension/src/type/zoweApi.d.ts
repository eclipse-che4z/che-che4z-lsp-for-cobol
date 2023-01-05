/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

/**
 * These types extracted from the ZOWE Explorer API's.
 */
interface IApiRegisterClient {

    getExplorerExtenderApi(): IApiExplorerExtender;
    getUssApi(profile: IProfileLoaded): IUss;
    getMvsApi(profile: IProfileLoaded): IMvs;
    getJesApi(profile: IProfileLoaded): IJes;
    registeredApiTypes(): string[];
}

interface IApiExplorerExtender {
    getProfilesCache(): ProfilesCache;
}

interface ProfilesCache {
    loadNamedProfile(name: string, type?: string): IProfileLoaded;
    getProfiles(type: string): IProfileLoaded[];
}

interface IUss {
    getContents(dataSetName: string, options?: any): Promise<IZosFilesResponse>;
    fileList(ussFilePath: string): Promise<IZosFilesResponse>;
}

interface IMvs {
    getContents(dataSetName: string, options?: any): Promise<IZosFilesResponse>;
    allMembers(dataSetName: string, options?: any): Promise<IZosFilesResponse>;
}

     interface IJes extends ICommon {
    /**
     * Returns a list of jobs for any parameters.
     *
     * @param {string} owner
     * @returns {Promise<zowe.IJob[]>} an array if IJob
     */
    getJobsByParameters?(params: zowe.IGetJobsParms): Promise<zowe.IJob[]>;

    /**
     * Returns a list of jobs for a specific user and prefix.
     *
     * @deprecated Use getJobsByParameters
     * @param {string} owner
     * @param {string} prefix
     * @returns {Promise<zowe.IJob[]>} an array if IJob
     */
    getJobsByOwnerAndPrefix(owner: string, prefix: string): Promise<zowe.IJob[]>;

    /**
     * Returns meta-data for one specific job identified by id.
     *
     * @param {string} jobid
     * @returns {Promise<zowe.IJob>}
     */
    getJob(jobid: string): Promise<zowe.IJob>;

    /**
     * Returns spool file meta-data for a job.
     *
     * @param {string} jobname
     * @param {string} jobid
     * @returns {Promise<zowe.IJobFile[]>}
     */
    getSpoolFiles(jobname: string, jobid: string): Promise<zowe.IJobFile[]>;

    /**
     * Retrieves spool file content as specified in the parms
     * to be store in a file.
     *
     * @param {zowe.IDownloadAllSpoolContentParms} parms
     * @returns {Promise<void>}
     */
    downloadSpoolContent(parms: zowe.IDownloadAllSpoolContentParms): Promise<void>;

    /**
     * Returns spool file content as a string.
     *
     * @param {string} jobname
     * @param {string} jobid
     * @param {number} spoolId
     * @returns {Promise<string>}
     */
    getSpoolContentById(jobname: string, jobid: string, spoolId: number): Promise<string>;

    /**
     * Returns the JCL of a job as a string.
     *
     * @param {zowe.IJob} job
     * @returns {Promise<string>}
     */
    getJclForJob(job: zowe.IJob): Promise<string>;

    /**
     * Submits a job with the JCL provided returning job meta-data.
     *
     * @param {string} jcl string of JCL that you want to be submit
     * @param {string} [internalReaderRecfm] record format of the jcl you want to submit. "F" (fixed) or "V" (variable)
     * @param {string} [internalReaderLrecl] logical record length of the jcl you want to submit
     * @returns {Promise<zowe.IJob>} IJob document with details about the submitted job
     */
    submitJcl(jcl: string, internalReaderRecfm?: string, internalReaderLrecl?: string): Promise<zowe.IJob>;

    /**
     * Submits a job that is stored in the data set name provided returning job meta-data.
     *
     * @param {string} jobDataSet
     * @returns {Promise<zowe.IJob>}
     * @memberof IJes
     */
    submitJob(jobDataSet: string): Promise<zowe.IJob>;

    /**
     * Cancels and purges a job identified by name and id.
     *
     * @param {string} jobname
     * @param {string} jobid
     * @returns {Promise<void>}
     * @memberof IJes
     */
    deleteJob(jobname: string, jobid: string): Promise<void>;

    /**
     * Cancels and purges a job identified by name and id.
     * This version returns information about the status of the job
     *
     * @param {string} jobname
     * @param {string} jobid
     * @returns {Promise<undefined | zowe.IJobFeedback>}
     * @memberof IJes
     */
    deleteJobWithInfo?(jobname: string, jobid: string): Promise<undefined | zowe.IJobFeedback>;
}

interface IProfileLoaded {
    profile: {
        encoding: string,
    };
    name: string;
}

interface IZosFilesResponse {
    apiResponse: {
        items: Array<{
            name: string,
            member: string,
        }>,
    };
}

interface IJobFile {

    /**
     * job id for a job
     * Uniquely identifies a job on a z/OS system
     * @type {string}
     * @memberof IJob
     */
    jobid: string;

    /**
     * job name for a job
     * @type {string}
     * @memberof IJob
     */
    jobname: string;

    /**
     * Record format of the spool file (DD)
     * @type {string}
     * @memberof IJobFile
     */
    recfm: string;

    /**
     * Total bytes in the spool file
     * @type {number}
     * @memberof IJobFile
     */
    "byte-count": number;

    /**
     * Total records (roughly equivalent to lines) in the spool file
     * @type {number}
     * @memberof IJobFile
     */
    "record-count": number;

    /**
     * unique identifier of job (substitute of job name and job id)
     * @type {string}
     * @memberof IJob
     */
    "job-correlator": string;

    /**
     * Job class for which job ran
     * @type {string}
     * @memberof IJobFile
     */
    class: string;

    /**
     * Identifier for this spool file.
     * each IJobFile for a single batch job will have a unique ID
     * @type {number}
     * @memberof IJobFileSimple
     */
    id: number;

    /**
     * DD name of job spool file
     * @type {string}
     * @memberof IJobFileSimple
     */
    ddname: string;

    /**
     * Direct access to job record content
     * @type {string}
     * @memberof IJobFile
     */
    "records-url": string;

    /**
     * Job DD lrecl (logical record length - how many bytes each record is)
     * @type {number}
     * @memberof IJobFile
     */
    lrecl: number;

    /**
     * The primary or secondary JES subsystem.
     * If this value is null, the job was processed by the primary subsystem.
     * @type {string}
     * @memberof IJobFile
     */
    subsystem: string;

    /**
     * The name of the job step during which this spool file was produced
     * @type {string}
     * @memberof IJobFileSimple
     */
    stepname: string;

    /**
     * If this spool file was produced during a job procedure step, the
     * name of the step will be here.
     * @type {string}
     * @memberof IJobStepData
     */
    procstep: string;
}
