// ===================================================
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

final snackBarFailIsEmpty = SnackBar(
  duration: const Duration(seconds: 5),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Opps deu algo errado',
    message: 'Erro ao tentar logar Verifique se os campos estão preenchidos',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.failure,
  ),
);
// ===================================================
final snackBarFailIsIcorret = SnackBar(
  duration: const Duration(seconds: 5),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Opps deu algo errado',
    message: 'Erro ao tentar logar,Email e/ou senha estão incorretos',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.failure,
  ),
);
// ===================================================
final snackBarConflictEmail = SnackBar(
  duration: const Duration(seconds: 5),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Opps deu algo errado ',
    message:
        'Existe uma conta mesmo email,Não é possivel criar uma conta com o mesmo email ',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.failure,
  ),
);
// ===================================================
// popup de aviso
final snackBarSucess = SnackBar(
  duration: const Duration(seconds: 4),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Logado com sucesso',
    message: 'Voce esta logando na conta com sucesso, Seja bem vindo !!',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.success,
  ),
);
// ===================================================
// popup de aviso
final snackBarSucessCreateAccount = SnackBar(
  duration: const Duration(seconds: 4),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Conta criada com sucesso',
    message: 'Voce esta logando na conta com sucesso, Seja bem vindo !!',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.success,
  ),
);

// ===================================================
// popup de aviso
final snackBarAddSucess = SnackBar(
  duration: const Duration(seconds: 4),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Item adicionado no carrinho',
    message: 'Voce esta 1+ no carrinho de compras',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.success,
  ),
);

// ===================================================
// popup de aviso
final snackBarAddError = SnackBar(
  duration: const Duration(seconds: 4),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Opps deu algo errado',
    message: 'Tente adicionar o item novamente em alguns minutos ',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.failure,
  ),
);
// ===================================================
// popup de aviso
final snackBardFieldEmailIsEmpty = SnackBar(
  duration: const Duration(seconds: 4),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Opps deu algo errado',
    message:
        'Verifique se os campos estão preenchidos, email valido email@dominio.com',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.failure,
  ),
);
// popup de aviso
final snackBarLogoff = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Fazendo logoff',
    message: 'Voce esta saindo da conta',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.success,
  ),
);
