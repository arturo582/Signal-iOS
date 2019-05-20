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
class TSUnreadIndicatorInteractionSerializer: SDSSerializer {

    private let model: TSUnreadIndicatorInteraction
    public required init(model: TSUnreadIndicatorInteraction) {
        self.model = model
    }

    // MARK: - Record

    func toRecord() throws -> InteractionRecord {
        let id: Int64? = nil

        let recordType: SDSRecordType = .unreadIndicatorInteraction
        guard let uniqueId: String = model.uniqueId else {
            owsFailDebug("Missing uniqueId.")
            throw SDSError.missingRequiredField
        }

        // Base class properties
        let receivedAtTimestamp: UInt64 = model.receivedAtTimestamp
        let timestamp: UInt64 = model.timestamp
        let threadUniqueId: String = model.uniqueThreadId

        // Subclass properties
        let attachmentFilenameMap: Data? = nil
        let attachmentIds: Data? = nil
        let authorId: String? = nil
        let beforeInteractionId: String? = nil
        let body: String? = nil
        let callSchemaVersion: UInt? = nil
        let callType: RPRecentCallType? = nil
        let configurationDurationSeconds: UInt32? = nil
        let configurationIsEnabled: Bool? = nil
        let contactId: String? = nil
        let contactShare: Data? = nil
        let createdByRemoteName: String? = nil
        let createdInExistingGroup: Bool? = nil
        let customMessage: String? = nil
        let envelopeData: Data? = nil
        let ephemeralMessage: Data? = nil
        let errorMessageSchemaVersion: UInt? = nil
        let errorType: TSErrorMessageType? = nil
        let expireStartedAt: UInt64? = nil
        let expiresAt: UInt64? = nil
        let expiresInSeconds: UInt32? = nil
        let groupMetaMessage: TSGroupMetaMessage? = nil
        let hasAddToContactsOffer: Bool? = nil
        let hasAddToProfileWhitelistOffer: Bool? = nil
        let hasBlockOffer: Bool? = nil
        let hasLegacyMessageState: Bool? = nil
        let hasSyncedTranscript: Bool? = nil
        let infoMessageSchemaVersion: UInt? = nil
        let isFromLinkedDevice: Bool? = nil
        let isLocalChange: Bool? = nil
        let isVoiceMessage: Bool? = nil
        let legacyMessageState: TSOutgoingMessageState? = nil
        let legacyWasDelivered: Bool? = nil
        let linkPreview: Data? = nil
        let messageId: String? = nil
        let messageSticker: Data? = nil
        let messageType: TSInfoMessageType? = nil
        let mostRecentFailureText: String? = nil
        let preKeyBundle: Data? = nil
        let quotedMessage: Data? = nil
        let read: Bool? = nil
        let recipientId: String? = nil
        let recipientStateMap: Data? = nil
        let schemaVersion: UInt? = nil
        let serverTimestamp: UInt64? = nil
        let sourceDeviceId: UInt32? = nil
        let unregisteredRecipientId: String? = nil
        let verificationState: OWSVerificationState? = nil
        let wasReceivedByUD: Bool? = nil

        return InteractionRecord(id: id, recordType: recordType, uniqueId: uniqueId, receivedAtTimestamp: receivedAtTimestamp, timestamp: timestamp, threadUniqueId: threadUniqueId, attachmentFilenameMap: attachmentFilenameMap, attachmentIds: attachmentIds, authorId: authorId, beforeInteractionId: beforeInteractionId, body: body, callSchemaVersion: callSchemaVersion, callType: callType, configurationDurationSeconds: configurationDurationSeconds, configurationIsEnabled: configurationIsEnabled, contactId: contactId, contactShare: contactShare, createdByRemoteName: createdByRemoteName, createdInExistingGroup: createdInExistingGroup, customMessage: customMessage, envelopeData: envelopeData, ephemeralMessage: ephemeralMessage, errorMessageSchemaVersion: errorMessageSchemaVersion, errorType: errorType, expireStartedAt: expireStartedAt, expiresAt: expiresAt, expiresInSeconds: expiresInSeconds, groupMetaMessage: groupMetaMessage, hasAddToContactsOffer: hasAddToContactsOffer, hasAddToProfileWhitelistOffer: hasAddToProfileWhitelistOffer, hasBlockOffer: hasBlockOffer, hasLegacyMessageState: hasLegacyMessageState, hasSyncedTranscript: hasSyncedTranscript, infoMessageSchemaVersion: infoMessageSchemaVersion, isFromLinkedDevice: isFromLinkedDevice, isLocalChange: isLocalChange, isVoiceMessage: isVoiceMessage, legacyMessageState: legacyMessageState, legacyWasDelivered: legacyWasDelivered, linkPreview: linkPreview, messageId: messageId, messageSticker: messageSticker, messageType: messageType, mostRecentFailureText: mostRecentFailureText, preKeyBundle: preKeyBundle, quotedMessage: quotedMessage, read: read, recipientId: recipientId, recipientStateMap: recipientStateMap, schemaVersion: schemaVersion, serverTimestamp: serverTimestamp, sourceDeviceId: sourceDeviceId, unregisteredRecipientId: unregisteredRecipientId, verificationState: verificationState, wasReceivedByUD: wasReceivedByUD)
    }

    public func serializableColumnTableMetadata() -> SDSTableMetadata {
        return TSInteractionSerializer.table
    }

    public func updateColumnNames() -> [String] {
        return [
            TSInteractionSerializer.idColumn,
            TSInteractionSerializer.receivedAtTimestampColumn,
            TSInteractionSerializer.timestampColumn,
            TSInteractionSerializer.uniqueThreadIdColumn
            ].map { $0.columnName }
    }

    public func uniqueIdColumnName() -> String {
        return TSInteractionSerializer.uniqueIdColumn.columnName
    }

    // TODO: uniqueId is currently an optional on our models.
    //       We should probably make the return type here String?
    public func uniqueIdColumnValue() -> DatabaseValueConvertible {
        // FIXME remove force unwrap
        return model.uniqueId!
    }
}
