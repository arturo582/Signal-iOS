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
class OWS102MoveLoggingPreferenceToUserDefaultsSerializer: SDSSerializer {

    private let model: OWS102MoveLoggingPreferenceToUserDefaults
    public required init(model: OWS102MoveLoggingPreferenceToUserDefaults) {
        self.model = model
    }

    // MARK: - Record

    func toRecord() throws -> DatabaseMigrationRecord {
        let id: Int64? = nil

        let recordType: SDSRecordType = ._102MoveLoggingPreferenceToUserDefaults
        guard let uniqueId: String = model.uniqueId else {
            owsFailDebug("Missing uniqueId.")
            throw SDSError.missingRequiredField
        }

        return DatabaseMigrationRecord(id: id, recordType: recordType, uniqueId: uniqueId)
    }

    public func serializableColumnTableMetadata() -> SDSTableMetadata {
        return OWSDatabaseMigrationSerializer.table
    }

    public func updateColumnNames() -> [String] {
        return []
    }

    public func uniqueIdColumnName() -> String {
        return OWSDatabaseMigrationSerializer.uniqueIdColumn.columnName
    }

    // TODO: uniqueId is currently an optional on our models.
    //       We should probably make the return type here String?
    public func uniqueIdColumnValue() -> DatabaseValueConvertible {
        // FIXME remove force unwrap
        return model.uniqueId!
    }
}
