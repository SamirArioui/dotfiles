"use strict";var o=Object.defineProperty;var d=Object.getOwnPropertyDescriptor;var p=Object.getOwnPropertyNames;var b=Object.prototype.hasOwnProperty;var S=(n,e)=>{for(var t in e)o(n,t,{get:e[t],enumerable:!0})},w=(n,e,t,a)=>{if(e&&typeof e=="object"||typeof e=="function")for(let s of p(e))!b.call(n,s)&&s!==t&&o(n,s,{get:()=>e[s],enumerable:!(a=d(e,s))||a.enumerable});return n};var D=n=>w(o({},"__esModule",{value:!0}),n);var I={};S(I,{default:()=>m});module.exports=D(I);var u=require("@raycast/api");var r=require("@raycast/api"),i=require("node:child_process");async function f(n,e,t){e&&await(0,r.showHUD)(e),await h({menubar:!1,status:!1}),(0,i.exec)(`/usr/bin/caffeinate ${N(t)} || true`),await l(n,!0)}async function h(n,e){e&&await(0,r.showHUD)(e),(0,i.execSync)("/usr/bin/killall caffeinate || true"),await l(n,!1)}async function l(n,e){n.menubar&&await c("index",{caffeinated:e}),n.status&&await c("status",{caffeinated:e})}async function c(n,e){try{await(0,r.launchCommand)({name:n,type:r.LaunchType.Background,context:e})}catch{}}function N(n){let e=(0,r.getPreferenceValues)(),t=[];return e.preventDisplay&&t.push("d"),e.preventDisk&&t.push("m"),e.preventSystem&&t.push("i"),n&&t.push(` ${n}`),t.length>0?`-${t.join("")}`:""}async function m(n){let{hours:e,minutes:t,seconds:a}=n.arguments;if(!(e||t||a)){await(0,u.showToast)(u.Toast.Style.Failure,"No values set for caffeinate length");return}if(!((!e||Number.isInteger(Number(e))&&Number(e)>=0)&&(!t||Number.isInteger(Number(t))&&Number(t)>=0)&&(!a||Number.isInteger(Number(a))&&Number(a)>=0))){await(0,u.showToast)(u.Toast.Style.Failure,"Please ensure all arguments are whole numbers");return}let y=Number(e)*3600+Number(t)*60+Number(a),g=`${e?`${e}h`:""}${t?`${t}m`:""}${a?`${a}s`:""}`;await f({menubar:!0,status:!0},`Caffeinating your Mac for ${g}`,`-t ${y}`)}
