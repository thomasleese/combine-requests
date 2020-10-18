//
//  RequestState.swift
//  CombineRequests
//
//  Created by Thomas Leese on 18/10/2020.
//

import Foundation

/// Represents the state of a request.
@frozen public enum RequestState<Success, Failure> where Failure: Error {
    /// The request is still loading, waiting for data or an error.
    case loading

    /// The request finished successfully with data.
    case success(Success)

    /// The request finished unsuccessfully with an error.
    case failure(Failure)

    /// True if the state is loading.
    var isLoading: Bool {
        if case .loading = self {
            return true
        } else {
            return false
        }
    }

    /// The data if the request was successful.
    var data: Success? {
        if case .success(let data) = self {
            return data
        } else {
            return nil
        }
    }

    /// The error if the request was unsuccessful.
    var error: Failure? {
        if case .failure(let error) = self {
            return error
        } else {
            return nil
        }
    }
}