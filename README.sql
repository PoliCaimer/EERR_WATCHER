# EERR_WATCHER
/*Pull out all nececerry details from incoming messages in EERR status */
/*serching substring in subnum, LPN, item, tote, detail or download seq*/

publish data
 where watcher = ''
|
[select ddd.dwnld_seq,
        ddd.ins_dt,
        ddd.ifd_id,
        ddd.ifd_seg_data,
        ddd.comm_cmnt,
        ddd.paczka,
        ddd.ordeer,
        ddd.lpn,
        ddd.item,
        ddd.qty,
        ddd.tote,
        ddd.detal,
        ddd.wrkref
   from (select s2.dwnld_seq,
                s.ins_dt,
                s.ifd_id,
                s.ifd_seg_id,
                s.ifd_data_dtl_seq,
                s.ifd_seg_data,
                s2.comm_cmnt,
                case when s.ifd_id = 'PALLETCLOSED' then(case when s.ifd_seg_id = 'DATA' then(case when s2.comm_cmnt like ('%3000%') then dbms_lob.substr(s2.comm_cmnt, 14, 51)
                                                                                                   when s2.comm_cmnt like ('%400%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt like ('%401%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt like ('%500%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt like ('%501%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt like ('%6000%') then dbms_lob.substr(s2.comm_cmnt, 14, 51)
                                                                                                   when s2.comm_cmnt like ('%800%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt like ('%801%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt like ('%700%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt like ('%701%') then dbms_lob.substr(s2.comm_cmnt, 9, 51)
                                                                                                   when s2.comm_cmnt is null and s.ifd_seg_data not like ('%LPN%') then dbms_lob.substr(s.ifd_seg_data, 9, 2)
                                                                                                   --update 29.11.2022

                                                                                                   else null
                                                                                              end)
                                                              else null
                                                         end)
                     when s.ifd_id = 'LOADUNITPALLETIZED' then(case when s.ifd_seg_id = 'DATA' then(case when s2.comm_cmnt like ('%3000%') then dbms_lob.substr(s2.comm_cmnt, 14, 50)
                                                                                                         when s2.comm_cmnt like ('%400%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt like ('%401%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt like ('%500%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt like ('%501%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt like ('%6000%') then dbms_lob.substr(s2.comm_cmnt, 14, 50)
                                                                                                         when s2.comm_cmnt like ('%800%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt like ('%801%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt like ('%700%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt like ('%701%') then dbms_lob.substr(s2.comm_cmnt, 9, 50)
                                                                                                         when s2.comm_cmnt is null then
                                                                                                         --update 29.11.2022

                                                                                                         (case when s.ifd_seg_data like ('%30000%') then dbms_lob.substr(s.ifd_seg_data, 14, 65)
                                                                                                               when s.ifd_seg_data like ('%60000%') then dbms_lob.substr(s.ifd_seg_data, 14, 65)
                                                                                                               when s.ifd_seg_data like ('%61000%') then dbms_lob.substr(s.ifd_seg_data, 14, 65)
                                                                                                               when s.ifd_seg_data like ('%700%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                               when s.ifd_seg_data like ('%701%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                               when s.ifd_seg_data like ('%800%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                               when s.ifd_seg_data like ('%801%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                               else null
                                                                                                          end)
                                                                                                         when s2.comm_cmnt like ('%10586: Invalid destination location%') then(case when s.ifd_seg_data like ('%3000%') then dbms_lob.substr(s.ifd_seg_data, 14, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%400%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%401%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%500%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%501%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%6000%') then dbms_lob.substr(s.ifd_seg_data, 14, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%800%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%801%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    when s.ifd_seg_data like ('%700%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    when s.ifd_seg_data like (' %701% ') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                    else null
                                                                                                                                                                               end)
                                                                                                         when s2.comm_cmnt like ('%Event failed to be logged
% 10845: Invalid LPN%') then(case when s.ifd_seg_data like ('%3000%') then dbms_lob.substr(s.ifd_seg_data, 14, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%400%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%401%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%500%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%501%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%6000%') then dbms_lob.substr(s.ifd_seg_data, 14, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%801%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%701%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%800%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                when s.ifd_seg_data like ('%700%') then dbms_lob.substr(s.ifd_seg_data, 9, 65)
                                                                                                                                                                                                else null
                                                                                                                                                                                           end)
                                                                                                         else null
                                                                                                    end)
                                                                    else null
                                                               end)
                     when s.ifd_id = 'DLUCONFIRMATION' then(case when s.ifd_seg_id = 'DATA' then(case when s.ifd_seg_data like ('%30000%') then dbms_lob.substr(s.ifd_seg_data, 9, 2)
                                                                                                      when s.ifd_seg_data like ('%90000%') then dbms_lob.substr(s.ifd_seg_data, 9, 2)
                                                                                                      when s.ifd_seg_data like ('%91000%') then dbms_lob.substr(s.ifd_seg_data, 9, 2)
                                                                                                      else null
                                                                                                 end)
                                                                 else null
                                                            end)
                     when s.ifd_id = 'ADVICECONFIRM' then(case when s.ifd_seg_id = 'DATA' then(case when s.ifd_seg_data like ('%"PARCEL_COURIER"%') then dbms_lob.substr(s.ifd_seg_data, 9, 49)
                                                                                                    else null
                                                                                               end)
                                                               else null
                                                          end)
                     when s.ifd_id = 'INVENTORYREPORTCORRECTION' then(case when s.ifd_seg_id = 'DATA' then(case when s.ifd_seg_data like ('%"100%') then dbms_lob.substr(s.ifd_seg_data, 9, 9)
                                                                                                                when s.ifd_seg_data like ('%"30000%') then dbms_lob.substr(s.ifd_seg_data, 14, 9)
                                                                                                                when s.ifd_seg_data like ('%"90000%') then dbms_lob.substr(s.ifd_seg_data, 9, 9)
                                                                                                                when s.ifd_seg_data like ('%"91000%') then dbms_lob.substr(s.ifd_seg_data, 9, 9)
                                                                                                                else null
                                                                                                           end)
                                                                           else null
                                                                      end)
                     else null
                end PACZKA,
                -- 
                --

                case when s.ifd_id = 'DLUCONFIRMATION' then(case when s.ifd_seg_id = 'ORDERCONTENT' then dbms_lob.substr(s.ifd_seg_data, 14, 2)
                                                                 else null
                                                            end)
                     else null
                end ordeer,
                --
                --

                case when s.ifd_seg_data like ('%LPN%') then dbms_lob.substr(s.ifd_seg_data, 18, 2)
                     when s.ifd_seg_data like ('%CLICK_AND_COLLECT%') then dbms_lob.substr(s.ifd_seg_data, 9, 2)
                     else null
                end LPN,
                --
                --

                case when s.ifd_id = 'DLUCONFIRMATION' then(case when s.ifd_seg_id = 'INVENTORYDESCRIPTION' then dbms_lob.substr(s.ifd_seg_data, 7, 9)
                                                                 else null
                                                            end)
                     else null
                end ITEM,
                --
                --

                case when s.ifd_id = 'DLUCONFIRMATION' then(case when s.ifd_seg_id = 'INVENTORYDESCRIPTION' then dbms_lob.substr(s.ifd_seg_data, 2, 18)
                                                                 else null
                                                            end)
                     else null
                end QTY,
                --
                --

                case when s.ifd_id = 'DLUCONFIRMATION' then(case when s.ifd_seg_id = 'SMYKINVENTORYPROPERTIES' then(case when s.ifd_seg_data like ('%1000%') then dbms_lob.substr(s.ifd_seg_data, 9, 2)
                                                                                                                         else null
                                                                                                                    end)
                                                                 when s.ifd_seg_id = 'DATA' then(case when s2.comm_cmnt like ('%on PW-IN%') then dbms_lob.substr(s2.comm_cmnt, 9, 44)
                                                                                                      else null
                                                                                                 end)
                                                                 else null
                                                            end)
                     when s.ifd_id = 'ADVICECONFIRM' then(case when s.ifd_seg_data like ('%DECANTING%') then dbms_lob.substr(s.ifd_seg_data, 9, 9)
                                                               when s.ifd_seg_data like ('%B2B-MULTI%') then dbms_lob.substr(s.ifd_seg_data, 9, 45)
                                                               when s.ifd_seg_data like ('%PARCEL_CLICK_COLLECT%') then dbms_lob.substr(s.ifd_seg_data, 9, 55)
                                                               else null
                                                          end)
                     else null
                end TOTE,
                --
                --

                case when s.ifd_id = 'ADVICECONFIRM' then(case when s.ifd_seg_id = 'INVENTORYATTRIBUTES' then(case when s.ifd_seg_data like ('%D000%') then dbms_lob.substr(s.ifd_seg_data, 12, 2)
                                                                                                                   else null
                                                                                                              end)
                                                               else null
                                                          end)
                     when s.ifd_id = 'DLUCONFIRMATION' then(case when s.ifd_seg_id = 'SMYKINVENTORYPROPERTIES' then(case when s2.comm_cmnt like ('%D000%') then dbms_lob.substr(s2.comm_cmnt, 12, 43)
                                                                                                                         when s2.comm_cmnt is null then dbms_lob.substr(s.ifd_seg_data, 12, 14)
                                                                                                                         when s.ifd_seg_data like ('%default%') then dbms_lob.substr(s.ifd_seg_data, 7, 14)
                                                                                                                         else null
                                                                                                                    end)
                                                                 when s.ifd_seg_id = 'DATA' then(case when s2.comm_cmnt like ('%D000%') then dbms_lob.substr(s2.comm_cmnt, 12, 43)
                                                                                                      else null
                                                                                                 end)
                                                                 else null
                                                            end)
                     else null
                end DETAL,
                --
                --
                --  
                --

                case when s.ifd_id = 'DLUCONFIRMATION' then(case when s.ifd_seg_id = 'ORDERLINECONTENT' then(case when s.ifd_seg_data like ('%W000%') then dbms_lob.substr(s.ifd_seg_data, 12, 22)
                                                                                                                  else null
                                                                                                             end)
                                                                 else null
                                                            end)
                     else null
                end wrkref
           from sl_ifd_data_dtl s
           join sl_ifd_data_hdr s2
             on s.ifd_data_seq = s2.ifd_data_seq
           join sl_dwnld s3
             on s2.dwnld_seq = s3.dwnld_seq
          where s3.dwnld_stat_cd in ('EERR')
         -- and s.ifd_seg_id in ('DATA', 'SMYKINVENTORYPROPERTIES', 'INVENTORYDESCRIPTION', 'INVENTORYATTRIBUTES', 'ORDERLINECONTENT', 'ORDERCONTENT')
) ddd
  where ddd.paczka = @watcher
     or ddd.lpn = @watcher
     or ddd.item = @watcher
     or ddd.tote = @watcher
     or ddd.detal = @watcher
     or ddd.ifd_id = @watcher
     or ddd.dwnld_seq = '17605514'
  order by ddd.dwnld_seq DESC,
        ddd.ifd_data_dtl_seq,
        ddd.ifd_id ASC,
        ddd.lpn DESC];
        
