//
//  MethodsFactory.swift
//
//
//  Created by Faustino Flores García on 14/1/22.
//

import Foundation

public class MethodsFactory
{
    // MARK: - Enum
    public enum InitMethodName: String
    {
        case initSession
        case initOperation
        case initSelphi
        case initSelphid
        case onboarding
        case authentication
        case addTracking
        case generateRawTemplate
        case closeSessionMethod
        case tokenize
        case customerTracking
    }

    enum FinishMethodName: String
    {
        case initSessionFinished
        case initOperationFinished
        case selphiFinished
        case selphidFinished
        case onboardingFinished
        case trackingFinished
        case generateRawTemplateFinished
        case closeSessionFinishedMethod
        case tokenizeFinished
        case customerTrackingFinished
        case authenticationFinished
        case trackingErrorFinished
    }

    // MARK: - VARS
    var methods = [MethodChannel]()
    private var channel: ChannelProtocol!

    // MARK: - INIT
    public init(channel: ChannelProtocol)
    {
        self.channel = channel
    }

    // MARK: - FUNC
    public func createMethods(delegate: FacephiSdkResponseProtocol)
    {
        let methodSession = MethodChannel(InitMethodName.initSession.rawValue,
                                          FinishMethodName.initSessionFinished.rawValue,
                                          channel.invoke,
                                          { args in
                                              delegate.getInitSessionResponse(args.toObject() ?? SdkResponse())
                                          }, { args in
                                              delegate.getInitSessionResponse(SdkResponse(withErrorType: args))
                                          })

        methods.append(methodSession)

        let methodOperation = MethodChannel(InitMethodName.initOperation.rawValue,
                                            FinishMethodName.initOperationFinished.rawValue,
                                            channel.invoke,
                                            { args in
                                                delegate.getInitOperationResponse(args.toObject() ?? SdkResponse())
                                            },
                                            { args in
                                                delegate.getInitOperationResponse(SdkResponse(withErrorType: args))
                                            })
        methods.append(methodOperation)

        let methodSelphi = MethodChannel(InitMethodName.initSelphi.rawValue,
                                         FinishMethodName.selphiFinished.rawValue,
                                         channel.invoke,
                                         { args in
                                             delegate.getSelphiResponse(args.toObject() ?? SdkResponse())
                                         },
                                         { args in
                                             delegate.getSelphiResponse(SdkResponse(withErrorType: args))
                                         })
        methods.append(methodSelphi)

        let methodSelphid = MethodChannel(InitMethodName.initSelphid.rawValue,
                                          FinishMethodName.selphidFinished.rawValue,
                                          channel.invoke,
                                          { args in
                                              delegate.getSelphIdResponse(args.toObject() ?? SdkResponse())
                                          },
                                          { args in
                                              delegate.getSelphIdResponse(SdkResponse(withErrorType: args))
                                          })
        methods.append(methodSelphid)

        let methodTracking = MethodChannel(InitMethodName.addTracking.rawValue,
                                           FinishMethodName.trackingFinished.rawValue,
                                           channel.invoke,
                                           { args in
                                               delegate.getTrackingResponse(args.toObject() ?? SdkResponse())
                                           },
                                           { args in
                                               delegate.getTrackingResponse(SdkResponse(withErrorType: args))
                                           })
        methods.append(methodTracking)

        let methodRawTemplate = MethodChannel(InitMethodName.generateRawTemplate.rawValue,
                                              FinishMethodName.generateRawTemplateFinished.rawValue,
                                              channel.invoke,
                                              { args in
                                                  delegate.getGenerateRawTemplateResponse(args)
                                              },
                                              { _ in
                                                  delegate.getGenerateRawTemplateResponse("")
                                              })
        methods.append(methodRawTemplate)

        let methodCloseSession = MethodChannel(InitMethodName.closeSessionMethod.rawValue,
                                               FinishMethodName.closeSessionFinishedMethod.rawValue,
                                               channel.invoke,
                                               { args in
                                                   delegate.getCloseSessionResponse(args.toObject() ?? SdkResponse())
                                               },
                                               { args in
                                                   delegate.getCloseSessionResponse(SdkResponse(withErrorType: args))
                                               })
        methods.append(methodCloseSession)

        let methodTokenize = MethodChannel(InitMethodName.tokenize.rawValue,
                                           FinishMethodName.tokenizeFinished.rawValue,
                                           channel.invoke,
                                           { args in
                                               delegate.getTokenizedString(args)
                                           },
                                           { _ in
                                               delegate.getTokenizedString("")
                                           })
        methods.append(methodTokenize)

        let methodSetCustomerId = MethodChannel(InitMethodName.customerTracking.rawValue,
                                                FinishMethodName.customerTrackingFinished.rawValue,
                                                channel.invoke,
                                                { args in
                                                    delegate.getSetCustomerIdResponse(args.toObject() ?? SdkResponse())

                                                },
                                                { args in
                                                    delegate.getSetCustomerIdResponse(SdkResponse(withErrorType: args))
                                                })
        methods.append(methodSetCustomerId)

        let methodOnboarding = MethodChannel(InitMethodName.onboarding.rawValue,
                                             FinishMethodName.onboardingFinished.rawValue,
                                             channel.invoke,
                                             { args in
                                                 delegate.getOnboardingResponse(args.toObject() ?? SdkResponse())
                                             },
                                             { args in
                                                 delegate.getOnboardingResponse(SdkResponse(withErrorType: args))
                                             })
        methods.append(methodOnboarding)

        let methodAuthentication = MethodChannel(InitMethodName.authentication.rawValue,
                                                 FinishMethodName.authenticationFinished.rawValue,
                                                 channel.invoke,
                                                 { args in
                                                     delegate.getAuthenticationResponse(args.toObject() ?? SdkResponse())
                                                 },
                                                 { args in
                                                     delegate.getAuthenticationResponse(SdkResponse(withErrorType: args))
                                                 })
        methods.append(methodAuthentication)

        let methodTrackingError = MethodChannel(nil,
                                                FinishMethodName.trackingErrorFinished.rawValue,
                                                nil,
                                                { args in
                                                    delegate.getTrackingErrorResponse(args.toObject() ?? SdkResponse())
                                                },
                                                nil)
        methods.append(methodTrackingError)
    }

    // MARK: - STATIC
    public func getMethodChannel(byInvokeMethodName: String) -> MethodChannel?
    {
        return methods.first(where: { $0.invokeMethodName == byInvokeMethodName })
    }

    public func getMethodChannel(byResponseMethodName: String) -> MethodChannel?
    {
        return methods.first(where: { $0.responseMethodName == byResponseMethodName })
    }
}
