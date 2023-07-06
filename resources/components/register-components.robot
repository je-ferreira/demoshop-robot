*** Settings ***
Documentation    This file contains the components of register page
Resource    ../main.robot

*** Variables ***

${FIRST_NAME_FIELD}               id:input-firstname
${LAST_NAME_FIELD}                id:input-lastname
${EMAIL_FIELD}                    id:input-email
${TELEPHONE_FIELD}                id:input-telephone
${PASSWORD_FIELD}                 id:input-password
${PASSWORD_CONFIRM_FIELD}         id:input-confirm
${PRIVACY_POLICY_CONFIRMATION}    name:agree
${SUBMIT_BUTTON}                  //input[contains(@type,'submit')]