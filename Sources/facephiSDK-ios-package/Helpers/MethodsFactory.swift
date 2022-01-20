//
//  MethodsFactory.swift
//
//
//  Created by Faustino Flores García on 14/1/22.
//

import Foundation

class MethodsFactory
{
    // MARK: - Enum
    enum InitMethodName: String
    {
        case initSession
        case initOnboardingProcess
        case initSelphi
        case initSelphid
        case addTracking
        case generateRawTemplate
        case closeSessionMethod
        case tokenize
        case customerTracking
    }

    enum FinishMethodName: String
    {
        case initSessionFinished
        case initOnboardingProcessFinished
        case selphiFinished
        case selphidFinished
        case trackingFinished
        case generateRawTemplateFinished
        case closeSessionFinishedMethod
        case tokenizeFinished
        case customerTrackingFinished
    }

    // MARK: - VARS
    var methods = [MethodChannel]()
    private var channel: ChannelProtocol!

    // MARK: - INIT
    init(channel: ChannelProtocol)
    {
        self.channel = channel
    }

    // MARK: - FUNC
    func createMethods(delegate: FacephiSdkResponseProtocol)
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

        let methodOnboarding = MethodChannel(InitMethodName.initOnboardingProcess.rawValue,
                                             FinishMethodName.initOnboardingProcessFinished.rawValue,
                                             channel.invoke,
                                             { args in
                                                 delegate.getInitOnboardingProcessResponse(args.toObject() ?? SdkResponse())
                                             },
                                             { args in
                                                 delegate.getInitOnboardingProcessResponse(SdkResponse(withErrorType: args))
                                             })
        methods.append(methodOnboarding)

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
                                              nil)
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
                                           }, nil)
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
    }

    // MARK: - STATIC
    func getMethodChannel(byInvokeMethodName: String) -> MethodChannel?
    {
        return methods.first(where: { $0.invokeMethodName == byInvokeMethodName })
    }

    func getMethodChannel(byResponseMethodName: String) -> MethodChannel?
    {
        return methods.first(where: { $0.responseMethodName == byResponseMethodName })
    }
}
