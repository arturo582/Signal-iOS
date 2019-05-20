//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDBCipher
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class SSKMessageSenderJobRecordSerializer: SDSSerializer {

    private let model: SSKMessageSenderJobRecord
    public required init(model: SSKMessageSenderJobRecord) {
        self.model = model
    }

    // MARK: - Record

    func toRecord() throws -> JobRecordRecord {
        let id: Int64? = nil

        let recordType: SDSRecordType = .messageSenderJobRecord
        guard let uniqueId: String = model.uniqueId else {
            owsFailDebug("Missing uniqueId.")
            throw SDSError.missingRequiredField
        }

        // Base class properties
        let failureCount: UInt = model.failureCount
        let label: String = model.label
        let status: SSKJobRecordStatus = model.status

        // Subclass properties
        let contactThreadId: String? = nil
        let envelopeData: Data? = nil
        let invisibleMessage: Data? = optionalArchive(model.invisibleMessage)
        let messageId: String? = model.messageId
        let removeMessageAfterSending: Bool? = model.removeMessageAfterSending
        let threadId: String? = model.threadId

        return JobRecordRecord(id: id, recordType: recordType, uniqueId: uniqueId, failureCount: failureCount, label: label, status: status, contactThreadId: contactThreadId, envelopeData: envelopeData, invisibleMessage: invisibleMessage, messageId: messageId, removeMessageAfterSending: removeMessageAfterSending, threadId: threadId)
    }

    public func serializableColumnTableMetadata() -> SDSTableMetadata {
        return SSKJobRecordSerializer.table
    }

    public func updateColumnNames() -> [String] {
        return [
            SSKJobRecordSerializer.idColumn,
            SSKJobRecordSerializer.failureCountColumn,
            SSKJobRecordSerializer.labelColumn,
            SSKJobRecordSerializer.statusColumn,
            SSKJobRecordSerializer.invisibleMessageColumn,
            SSKJobRecordSerializer.messageIdColumn,
            SSKJobRecordSerializer.removeMessageAfterSendingColumn,
            SSKJobRecordSerializer.threadIdColumn
            ].map { $0.columnName }
    }

    public func uniqueIdColumnName() -> String {
        return SSKJobRecordSerializer.uniqueIdColumn.columnName
    }

    // TODO: uniqueId is currently an optional on our models.
    //       We should probably make the return type here String?
    public func uniqueIdColumnValue() -> DatabaseValueConvertible {
        // FIXME remove force unwrap
        return model.uniqueId!
    }
}
